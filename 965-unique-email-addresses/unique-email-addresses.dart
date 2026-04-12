class Solution {
  int numUniqueEmails(List<String> emails) {
    Set<String> seen = {};

    for (String email in emails) {
      List<String> parts = email.split('@');
      String local = parts[0];
      String domain = parts[1];

      // remove everything after '+'
      if (local.contains('+')) {
        local = local.substring(0, local.indexOf('+'));
      }

      // remove all '.'
      local = local.replaceAll('.', '');

      seen.add(local + '@' + domain);
    }

    return seen.length;
  }
}