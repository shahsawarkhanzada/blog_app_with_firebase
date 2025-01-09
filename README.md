#Uploading file to firebse database

1. Create the Realtime database in your firebase console project

2. Initialize the firebase_storage in the file

3. create the reference for firebase_database

4. create the reference for firebase_auth

5. Now go to upload button. below all steps are done in the upload button logic.

6. create a variable for date

7. create the reference variale of // firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/projectname $date')

8. Create a try and cath method. Do all the below steps in try method 

9. create uploadTask variable to upload the file // firebase_storage.UploadTask uploadtask = ref.putFile(image!.absolute);

10. wait for the file to upload  //await Future.value(uploadtask)

11. Save the Url of uploaded image in a variable // var newUrl = await ref.detDownloadURL()

12. Create a variable for user to get info of current loggedIn User. 

13. Now, Save the file to the node of the database created using the references created for firebase_database in point 3  // blogRef.child('Blog List').child(date.toString()).set().then().OnError()

