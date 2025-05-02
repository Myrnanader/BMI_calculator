
/*
class Elevatedbottun extends StatefulWidget {
   Elevatedbottun({super.key , required this.name , required this.icon});
  final String name;
  final Icon icon;
 
  

  @override
  State<Elevatedbottun> createState() => _ElevatedbottunState();
}

class _ElevatedbottunState extends State<Elevatedbottun> {
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style:ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: darkerColor,
          padding: EdgeInsets.all(16), 
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(widget.icon.icon),
          ],
        ),
      ),
    );
 
  }
}
  */            

        /*
        SizedBox(
            width: 342,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                double bmi = weight / pow(height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: bmi),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,  
                foregroundColor: darkerColor,
                padding: EdgeInsets.all(16),
              ),
              child: Text(
                'calculate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          */      