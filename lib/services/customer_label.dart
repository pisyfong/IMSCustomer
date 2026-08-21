/// One definition of how a customer is written on screen and on paper.
///
/// The house style is `CODE - NAME`: the code is what staff key, quote and
/// read out, the name is what makes it recognisable. Before this existed the
/// app used at least three spellings — `CODE · NAME` in pick group headers,
/// `NAME (CODE)` in the add-items sheet, and a bare `CODE` on the line rows —
/// so the same customer read differently on three screens of one workflow.
///
/// Every branch degrades to something usable: a missing name leaves the code,
/// a missing code leaves the name, and neither leaves an explicit placeholder
/// rather than an empty gap that reads as a rendering fault.
class CustomerLabel {
  CustomerLabel._();

  static const String unknown = 'No customer';

  /// `CODE - NAME`, or whichever half is available.
  static String format(String? code, String? name) {
    final c = (code ?? '').trim();
    final n = (name ?? '').trim();
    if (c.isEmpty && n.isEmpty) return unknown;
    if (n.isEmpty) return c;
    if (c.isEmpty) return n;
    return '$c - $n';
  }

  /// `SQ · CODE - NAME` for a line that belongs to a quotation.
  ///
  /// Shown on every line, not just lines that span several quotations. A
  /// picker working a single-SQ document still needs to know whose goods are
  /// in their hand — and if they never see the attribution on simple picks,
  /// they have no habit of reading it on the complicated ones.
  static String sqWithCustomer(String? sq, String? code, String? name) {
    final s = (sq ?? '').trim();
    final who = format(code, name);
    if (s.isEmpty) return who == unknown ? 'No SQ' : who;
    if (who == unknown) return s;
    return '$s  ·  $who';
  }
}
