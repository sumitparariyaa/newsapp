import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
 bool isSelected = false;
bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings',style: TextStyle(fontWeight:FontWeight.w500),),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: width*0.06,vertical: height*0.03),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1985&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      width: width*0.2,
                      height: height*0.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: width*0.06,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sumit Kumar',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                       ),
                      ),
                      Text('parariyasumit@gmail.com',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),
                      Text('Sign Out',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,color: Colors.orange
                      ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
              ),
              child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text("Dark Mode",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(
                              height: height*0.03,
                              width: width*0.15,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child:CupertinoSwitch(
                                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                                  onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                                  activeColor: Colors.orange,
                                  trackColor: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Notifications",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(
                              height: height*0.03,
                              width: width*0.15,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child:CupertinoSwitch(
                                  value: isSelected2,
                                  onChanged: (value){
                                    setState(() {
                                      isSelected2 = value;
                                    });
                                  },
                                  activeColor: Colors.orange,
                                  trackColor: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text("Account",style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,fontSize: 20,height: 0
              ),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 26),
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Edit Account",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),),
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Change Password",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),),
                            const Icon(Icons.keyboard_arrow_right_outlined)

                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Language",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),),
                            const Icon(Icons.keyboard_arrow_right_outlined)

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text("Privacy and Policy",style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,fontSize: 20,height: 0
              ),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 26),
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Private Account",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(
                              height: height*0.03,
                              width: width*0.1,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child:CupertinoSwitch(
                                 value: isSelected,
                                  onChanged: (value){
                                    setState(() {
                                      isSelected = value;
                                    });
                                  },
                                  activeColor: Colors.orange,
                                  trackColor: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Privacy and Security Help",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),),
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}