import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'sync_info.dart';
import 'main.dart'; // Import main.dart to access the global Isar instance

class OnlineStatusIcon extends StatefulWidget {
  final bool isOnline;
  final VoidCallback? onTap;
  final DateTime? lastSyncTime;

  const OnlineStatusIcon({
    Key? key,
    required this.isOnline,
    this.onTap,
    this.lastSyncTime,
  }) : super(key: key);

  @override
  State<OnlineStatusIcon> createState() => _OnlineStatusIconState();
}

class _OnlineStatusIconState extends State<OnlineStatusIcon> {
  bool _isOverlayVisible = false;
  bool _isManuallyChecking = false;
  OverlayEntry? _overlayEntry;
  Timer? _hideTimer;
  Timer? _connectionCheckTimer;
  // Use global Isar instance
  DateTime? _lastSyncTime;

  @override
  void initState() {
    super.initState();
    // Load sync info from the global Isar instance
    _loadSyncInfo();
    // Update sync info based on initial online status
    _updateSyncInfo(widget.isOnline);
    
    // Start periodic connection check every 10 seconds
    _connectionCheckTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      _checkConnection();
    });
  }

  Future<void> _loadSyncInfo() async {
    try {
      // Try to get the existing record from the global Isar instance
      final syncInfo = await isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
      
      if (syncInfo != null && mounted) {
        setState(() {
          _lastSyncTime = syncInfo.lastSyncTime;
        });
      }
    } catch (e) {
      debugPrint('Error loading sync info: $e');
    }
  }

  // Automatic background connection check (no loading animation)
  Future<void> _checkConnection() async {
    if (widget.onTap != null) {
      widget.onTap!();
    } else {
      // If no onTap callback is provided, implement a default connection check
      const apiUrl = 'http://plusintralinkapps.dyndns.org:1194/api/customers?page=1&limit=1';
      try {
        final response = await http.get(Uri.parse(apiUrl)).timeout(const Duration(seconds: 3));
        final isOnline = response.statusCode == 200;
        
        // Only update if the status changed to avoid unnecessary updates
        if (isOnline != widget.isOnline && mounted) {
          // This will trigger didUpdateWidget which will call _updateSyncInfo
          // We're using a callback approach to update the parent widget's state
          if (widget.onTap != null) {
            widget.onTap!();
          }
        }
      } catch (_) {
        // Connection failed
        if (widget.isOnline && mounted && widget.onTap != null) {
          // Only notify if we were previously online
          widget.onTap!();
        }
      }
    }
  }
  
  // Manual connection check with loading animation
  Future<void> _manualCheckConnection() async {
    // Show loading animation
    setState(() {
      _isManuallyChecking = true;
    });
    
    try {
      // Use the onTap callback if provided
      if (widget.onTap != null) {
        widget.onTap!();
      } else {
        // Otherwise implement our own connection check
        const apiUrl = 'http://plusintralinkapps.dyndns.org:1194/api/customers?page=1&limit=1';
        try {
          final response = await http.get(Uri.parse(apiUrl)).timeout(const Duration(seconds: 3));
          final isOnline = response.statusCode == 200;
          
          // Update sync info with the new status
          await _updateSyncInfo(isOnline);
        } catch (_) {
          // Connection failed
          await _updateSyncInfo(false);
        }
      }
      
      // Add a small delay to make the loading animation visible
      await Future.delayed(const Duration(milliseconds: 500));
    } finally {
      // Hide loading animation if widget is still mounted
      if (mounted) {
        setState(() {
          _isManuallyChecking = false;
        });
      }
    }
  }

  Future<void> _updateSyncInfo(bool isOnline) async {
    try {
      final now = DateTime.now();
      
      // Try to get the existing record from the global Isar instance
      var syncInfo = await isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
      
      // If no record exists, create a new one
      if (syncInfo == null) {
        syncInfo = SyncInfo.create();
      }
      
      // Update the record
      syncInfo.isOnline = isOnline;
      syncInfo.lastSyncTime = now; // Always update the last sync time
      
      // Save to Isar
      await isar.writeTxn(() async {
        await isar.syncInfos.put(syncInfo!);
      });
      
      // Update state
      setState(() {
        _lastSyncTime = now;
      });
    } catch (e) {
      debugPrint('Error updating sync info: $e');
    }
  }

  @override
  void dispose() {
    _hideOverlay();
    _hideTimer?.cancel();
    _connectionCheckTimer?.cancel();
    super.dispose();
  }

  void _displayOverlay(BuildContext context) {
    _hideOverlay(); // Hide any existing overlay

    // Create the overlay
    _overlayEntry = OverlayEntry(
      builder: (context) {
        // Use a Stack with Positioned.fill to take the full screen
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              // Invisible dismissible area that covers the entire screen
              Positioned.fill(
                child: GestureDetector(
                  onTap: _hideOverlay,
                  behavior: HitTestBehavior.translucent,
                  child: Container(color: Colors.transparent),
                ),
              ),
              // Dropdown positioned at the top right corner of the screen
              Positioned(
                top: MediaQuery.of(context).padding.top + kToolbarHeight + 10,
                right: 10,
                width: 220,
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              widget.isOnline ? Icons.cloud_done : Icons.cloud_off,
                              color: widget.isOnline ? Colors.green : Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Status: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              widget.isOnline ? 'Online' : 'Offline',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: widget.isOnline ? Colors.green : Colors.red[700],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(height: 1),
                        const SizedBox(height: 8),
                        // Always show connection status
                        Row(
                          children: [
                            Icon(
                              widget.isOnline ? Icons.check_circle_outline : Icons.info_outline,
                              size: 16,
                              color: widget.isOnline ? Colors.green : Colors.orange,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.isOnline ? 'Server connection is active' : 'Server connection is offline',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Always show last sync time
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FutureBuilder<SyncInfo?>(  
                                future: isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst(),
                                builder: (context, snapshot) {
                                  // Use snapshot data if available, otherwise fall back to _lastSyncTime
                                  final syncTime = snapshot.hasData && snapshot.data?.lastSyncTime != null
                                      ? snapshot.data!.lastSyncTime
                                      : _lastSyncTime;
                                  
                                  return Text(
                                    'Last synced: ${syncTime != null 
                                      ? _formatDateTime(syncTime) 
                                      : "Never"}',
                                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _hideOverlay();
                              _manualCheckConnection();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Check Connection'),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    // Add the overlay to the Overlay
    Overlay.of(context).insert(_overlayEntry!);
    
    // Auto-hide after 4 seconds
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 4), _hideOverlay);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return 'Never';
    }
    
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    String result;
    if (difference.inSeconds < 10) {
      result = 'Just now';
    } else if (difference.inSeconds < 60) {
      result = '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      final seconds = difference.inSeconds % 60;
      if (seconds > 0) {
        result = '${difference.inMinutes} min ${seconds} sec ago';
      } else {
        result = '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
      }
    } else if (difference.inHours < 24) {
      final minutes = difference.inMinutes % 60;
      if (minutes > 0) {
        result = '${difference.inHours} hr ${minutes} min ago';
      } else {
        result = '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
      }
    } else if (difference.inDays < 7) {
      result = '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else {
      final formatter = DateFormat('MMM d, h:mm a');
      result = formatter.format(dateTime);
    }
    
    return result;
  }

  @override
  void didUpdateWidget(OnlineStatusIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isOnline != widget.isOnline) {
      debugPrint('Online status changed from ${oldWidget.isOnline} to ${widget.isOnline}');
      _updateSyncInfo(widget.isOnline);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isManuallyChecking
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(
              widget.isOnline ? Icons.cloud : Icons.cloud_off,
              color: widget.isOnline ? Colors.blue : Colors.grey,
            ),
      tooltip: widget.isOnline ? 'Online' : 'Offline',
      onPressed: () {
        _displayOverlay(context);
      },
    );
  }
}
