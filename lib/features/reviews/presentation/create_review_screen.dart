import 'package:flutter/material.dart';
class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});
 static const String name = 'create-review';
  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 120),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'First name'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(hintText: 'Last name'),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 150,
                child: TextFormField(
                  maxLines: null,
                  expands: true,  // height পুরোটা ব্যবহার করবে
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: "Write your review...",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              FilledButton(onPressed: (){}, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
