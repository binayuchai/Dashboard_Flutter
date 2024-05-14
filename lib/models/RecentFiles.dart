
class RecentFile {
  final String? icon;
  final String? title;
  final String? date;
  final String? size;

  RecentFile({
    this.icon,
    this.title,
    this.date,
    this.size,
  });
}
List demoRecentFiles = [
  RecentFile(
    icon: "assets/images/icons8-adobe-xd.svg",
    title: "XD File",
    date: "01-03-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: "assets/images/icons8-figma.svg",
    title: "Figma File",
    date: "27-02-2021",
    size: "19.0mb",
  ),
  // RecentFile(
  //   icon: "assets/images/icons8/docs.svg",
  //   title: "Document",
  //   date: "23-02-2021",
  //   size: "32.5mb",
  // ),
  // RecentFile(
  //   icon: "assets/images/icons8-mp3-50.png",
  //   title: "Sound File",
  //   date: "21-02-2021",
  //   size: "3.5mb",
  // ),

  RecentFile(
    icon: "assets/images/file_type_pdf_icon_130274.svg",
    title: "Sales PDF",
    date: "25-02-2021",
    size: "3.5mb",
  ),
  RecentFile(
    icon: "assets/images/microsoft_office_excel_logo_icon_145720.svg",
    title: "Excel File",
    date: "25-02-2021",
    size: "34.5mb",
  ),
];
