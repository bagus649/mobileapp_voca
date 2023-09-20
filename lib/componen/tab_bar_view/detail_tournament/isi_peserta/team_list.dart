import 'package:flutter/material.dart';

class TeamContainer extends StatefulWidget {
  final String? teamName;
  final String? teamImage;
  final List<Member>? members;

  TeamContainer({
    this.teamName,
    this.teamImage,
    this.members,
  });

  @override
  _TeamContainerState createState() => _TeamContainerState();
}

class _TeamContainerState extends State<TeamContainer> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 2), // Atur offset sesuai keinginan
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE3FDE4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (widget.teamImage != null)
                              Image.asset(
                                widget.teamImage!,
                                width: 40,
                                height: 40,
                              ),
                            if (widget.teamName != null)
                              SizedBox(
                                width: 12,
                              ),
                            if (widget.teamName != null)
                              Container(
                                width: 260,
                                padding: EdgeInsets.only(top: 4, left: 2),
                                child: Text.rich(
                                  TextSpan(
                                    text: widget.teamName!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            // Text(
                            //   widget.teamName!,
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: _toggleExpansion,
                      child: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_isExpanded && widget.members != null)
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.members!.map((member) {
                  return ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 260,
                          padding: EdgeInsets.only(top: 4, left: 2),
                          child: Text.rich(
                            TextSpan(
                              text: (member.name),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff232440)),
                            ),
                          ),
                        ),
                        // Text(member.name),
                        Spacer(),
                        Container(
                          width: 64,
                          padding: EdgeInsets.only(top: 4, left: 2),
                          child: Text.rich(
                            TextSpan(
                              text: (member.status),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6E6E82)),
                            ),
                          ),
                        ),
                        // Text(member.status),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class Member {
  final String name;
  final String status;

  Member({required this.name, required this.status});
}
