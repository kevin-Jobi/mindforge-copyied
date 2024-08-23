
import "package:flutter/material.dart";
import "package:mind_forge/screens/profile/profile_crud.dart";
import "package:mind_forge/services/models/model.dart";


class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
    required this.box,
  });

  final Model1? box;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.orange[300]!,
          width: 5.0,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: box == null
            ? GestureDetector(
              child: Text(
                  'No profile found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange[900],
                  ),
                ),
                 onTap: () { // Wrap the Navigator call in an anonymous function
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyProfileCrud()),
        );
      },
            )
            :ListTile(
      leading: box!.profileImg.isNotEmpty
          ? CircleAvatar(
              radius: 30,
              backgroundImage: MemoryImage(box!.profileImg),
            )
          : Icon(Icons.person, size: 40, color: Colors.orange[600]),
      title: Text(
        box!.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.orange[900],
        ),
      ),
      onTap: () { // Wrap the Navigator call in an anonymous function
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyProfileCrud()),
        );
      },
    ),
    
      ),
    );
  }
}



  Widget buildProfileOption({
    required IconData icon,
    required Color color,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.orange[200]!,
            width: 3.0,
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30),
            SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.orange[900],
              ),
            ),
          ],
        ),
      ),
    );
  }