String serviceDescriptionDetails(String? service) {
  switch (service) {
    case 'Land Grant':
      return "Full Description about Land Grant";
    case 'Land Exchange':
      return "Full Description about Land Exchange";
    case 'House Exchange':
      return "Full Description about House Exchange";
    case 'Residential Land Purchase':
      return "Full Description about Residential Land Purchase";
    case 'House Construction':
      return "Full Description about House Construction";
    case 'House Purchase':
      return "Full Description about House Purchase";
    case 'Other Loans':
      return "Full Description about Other loans";
    default:
      return "Nothing";
  }
}
