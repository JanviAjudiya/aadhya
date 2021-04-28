import "package:flutter/material.dart";

class faqs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return faqsState();
  }

}
class faqsState extends State<faqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: Center(
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('What is netbanking ?'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("Internet banking, also known as online banking or e-bankingor Net Banking is a facility offered by banks "
                      "and financial institutions that allow customers to use banking services over the internet."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('What should I do after logging in: '),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("When you log in for the first time, the system will prompt you to change your username and password. "
                      "Username can be alpha-numeric and maximum 20 characters. Your password should be minimum 8 characters and maximum 20 characters. "
                      "It should have alpha-numeric and at least one special character."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('I am getting message "invalid User ID and password combination" : '),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("This could be due to wrong User ID password combination used by you. Please note user id and password are case sensitive. "
                      "e.g. ROHIT, rohit and Rohit are different here. " "Your password should be minimum 8 characters and maximum 20 characters. It should have alpha-numeric and at "
                      "least one special character e.g.rohit@0658"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('I want to send some message to my branch: '),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("Please contact to your branch for branch specific issues."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('I am unable to do fund transfer:'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("This is because your branch has not given you transaction rights, "
                      "please go Request & Enquires tab and upgrade access level from View Only to Transaction Rights himself online."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('I want to transfer funds to other bank: '),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("You can transfer funds to other bank’s accounts through RTGS/ NEFT /IMPS in online."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),

              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('Whether encrypted files can be uploaded? '),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("Yes. Upload of files encrypted using either symmetric keys or asymmetric keys (PKI) is supported."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('My name is wrongly spelt in Onlinesbi: '),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("Please go to my account and correct the spelling or the way you want your name to appear on the application."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: Colors.blue[100],
                title: Text('How safe/secure is our net banking account? '),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(content: Text("The Internet banking portal is a highly secure, verisign certified site with the transaction data travelling encrypted via "
                      "an SSL medium (256-bit SSL tunnel), the highest level of security on the internet. The advanced EV-SSL Certificate provides evidence of authenticity to the website "
                      "which safeguards users from accessing through unauthorised sites."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),

        ),
      ),

    );
  }
}