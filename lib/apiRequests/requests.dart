import 'package:opshr/general/allExports.dart';
import 'package:dio/dio.dart';

//
String _clientSecret = "vM0Waw8Zm3TbVNYbYkQ9aoRbzwEcFAPR3EaINF6g";
int _clientId = 1;

String getBaseUrl () {
  return 'https://core-portal.edcmarketplace.com.ng';
}


//
class ApiRequests{


  Function registerUser = (User user, String password) async {

    try {

      print('started request');

      var response = await Dio().post(

          getBaseUrl() + "/register",
          options: Options(contentType: Headers.jsonContentType),
          data: {"firstname": user.firstName, "lastname": user.lastName, "email": user.email, "password": password, "company": user.company.name, "phone": user.phoneNumber.toString(), "client_id": _clientId, "client_secret": _clientSecret, "feature_select": "all" }

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return true;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }



  };


  Function authorizeViaPassword = (String email, String password) async {

    try {

      print('started request');

      var response = await Dio().post(

          getBaseUrl() + "/oauth/token",
          options: Options(contentType: Headers.formUrlEncodedContentType),

          data: {"grant_type": "password", "username": email, "password": password, "client_id": _clientId, "client_secret": _clientSecret, "scope": "*" }

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }



  };


  Function retrieveCompanyData = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/company/status",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function retrieveUserData = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function createDepartment = ( Department department) async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(

        getBaseUrl() + "/company/departments",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

        data: {"name": department.name, "description": department.description},

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');
      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function listDepartments = () async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().get(

        getBaseUrl() + "/company/departments",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function updateDepartment = ( String description) async {

    try {

      print('started request');

      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";


      var response = await Dio().put(

        getBaseUrl() + "/company/departments",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          contentType: Headers.jsonContentType,
          validateStatus: (status) => true,
        ),

        data: { "description": description},




      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function deleteDepartment = (String departmentId) async {

    try {

      print('started request');

      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().delete(

        getBaseUrl() + "/company/departments/$departmentId",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function addEmployee = (Employee employee) async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(

          getBaseUrl() + "/company/employees",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }),

          data: {"firstname": employee.firstName, "lastname": employee.lastName, "gender": employee.gender, "email": employee.email, "phoneNumber": employee.phoneNumber, "salaryAmount": employee.salaryAmount, "staffCode": employee.staffCode, "jobTitle": employee.jobTitle }

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {  print('error');
    print(e);
    return false;
    }


  };

  Function listEmployees = () async {

    try {

      print('started request');
      //final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().get(

        getBaseUrl() + "/company/employees",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  };


  Function deleteEmployee = (String employeeID) async {

    try {

      print('started request');

      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().delete(

        getBaseUrl() + "/company/employees/$employeeID",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function createTeam = (Team team) async {

    try {

      print('started request');

      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(

        getBaseUrl() + "/company/teams",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

        data: {"name": team.name, "description": team.description},

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function updateTeam = (Team team) async {

    try {

      print('started request');

      //ffinal token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().put(

        getBaseUrl() + "/company/teams/",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),

        data: {"name": team.name, "description": team.description},

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function listTeams = () async {

    try {

      print('started request');
      //final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().get(

        getBaseUrl() + "/company/teams",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function deleteTeam = (String teamId) async {

    try {

      print('started request');
      //final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().delete(

        getBaseUrl() + "/company/teams/$teamId",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  };

  Function addProduct = (Product product) async {

    try {

      print('started request');

      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";


      var response = await Dio().post(

          getBaseUrl() + "/products",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }),

          data: {"name": product.name, "description": product.description, "inventory": product.stockAmount, "prices": [{"price": product.unitPrice, "currency": product.currency}]}

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function deleteProduct = (String productID) async {

    try {

      print('started request');

      var response = await Dio().delete(

        getBaseUrl() + "/products/$productID",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function listProducts = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/products",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };



  Future getAllEmployee({String taskId})
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().get(
        getBaseUrl() + "/company/tasks/employee_task/$taskId",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
          "content-type":"application/json"
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }

  Future getAllTasks()
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().get(
        getBaseUrl() + "/company/tasks/all",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
          "content-type":"application/json"
        }),

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }

  Future createTask(
      {String task,
        String task_description,
        String priority,
        String start_date,
        String end_date})
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
          getBaseUrl() + "/company/tasks/create",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
            "content-type":"application/json"
          }),

          data: {"task": task, "task_description": task_description, "priority": priority, "start_date": start_date, "end_date": end_date }

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }


  Future editTasks(String id) async {
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/company/tasks/$id",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

      );


      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  }


  Future updateTask(
      {
        String id,
        String task,
        String task_description,
        String priority,
        String projectStatus
      }) async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(

          getBaseUrl() + "/company/tasks/update/$id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }),

          data: {"id":id,"task": task, "task_description": task_description, "priority": priority, "project_status": projectStatus}


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  }

  Future assignTask({String taskId, String employeeEmail}) async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(

          getBaseUrl() + "/company/tasks/assign_task/$taskId",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
            "content-type":"application/json",
          }),

          data: {'email' : employeeEmail}

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  }

  Future removeEmployeeFromTask({String taskId,String employeeId}) async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
          getBaseUrl() + "/company/tasks/remove_task/$taskId",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
            "content-type":"application/json",
          }),

          data: {"employee_id":employeeId}


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  }

  Future viewAllEmployeeAssignedToTasks() async {

    try {
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      print('started request');

      var response = await Dio().get(
        getBaseUrl() + "/company/tasks/employee_tasks/{id}",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
          "content-type":"application/json",
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  }



  Function deleteTask = (String taskId) async {

    try {

      print('started request');

      var response = await Dio().delete(

        getBaseUrl() + "/company/tasks/$taskId",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function createOrder = (Order order) async {

    try {

      print('started request');

      var response = await Dio().post(

          getBaseUrl() + "/orders",
          options: Options(headers: {
            'Authorization': 'Bearer $userAccessToken',
          }),

          data: {"title": order.invoiceTitle, "description": order.invoiceDescription, "currency": order.currency, "products":[{"id":order.product.productId, "quantity": order.amountOrdered}], "departments": ["sa"]}


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function listOrders = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/orders",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function editOrder = (Order order) async {

    try {

      print('started request');

      var response = await Dio().put(

          getBaseUrl() + "/orders/${order.invoiceId}",
          options: Options(
            headers: {
              'Authorization': 'Bearer $userAccessToken',
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ),

          data: {"title": order.invoiceTitle, "description": order.invoiceDescription, "currency": order.currency, "products":[{"id":order.product.productId, "quantity": order.amountOrdered}], "departments": ["123R"]}//order.department.id


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function deleteOrder = (String orderId) async {

    try {

      print('started request');

      var response = await Dio().delete(

        getBaseUrl() + "/orders/$orderId",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Future payrollAuthority(

      {String authority_name,
        String payment_mode,
        String default_payment_details,
       String payment_details})
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
          getBaseUrl() + "/payroll/authority",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              "Accept": "application/json",
              "content-type":"application/json"
            },

            //contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ),

          //options: Options(headers: {
           // 'Authorization': 'Bearer $token',
            //"Accept": "application/json",

        //  }),
          data: {"authority_name": authority_name, "payment_mode": payment_mode, "default_payment_details": default_payment_details,"payment_details": payment_details, }

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }

  Future allAuthority() async {
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/payroll/authority",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

      );


      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  }


  Future singleView(String search) async {
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/company/payroll/authority/{id}",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

      );


      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


}


  Future updatePayroll(String id,
      {
        String authority_name,
        String payment_mode,
        String default_payment_details,
        String default_payment_account})

  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().put(
          getBaseUrl() + "/payroll/authority/$id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }),

          data: {"id":id,"authority_name": authority_name, "payment_mode": payment_mode, "default_payment_details": default_payment_details, " default_payment_account":  default_payment_account}


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  }

  Future payrollAllowance(Payroll payroll,

      {String allowance_name,
        String authority_name,
        String allowance_type,
        String model,
        String model_data,
      })
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
          getBaseUrl() + "/payroll/allowance",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
            "content-type":"application/json"
          }),

          data: {"allowance_name": allowance_name, "authority_name": authority_name, "allowance_type": allowance_type,"model": model, "model_data": model_data,}

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }

  Future allowanceView(String id) async {
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/company/payroll/allowance/{id}",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

      );


      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  }

  Future allowanceSearch(String search) async {
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/company/payroll/allowance/",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

      );


      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  }
  Future createPaygroup(

      {String group_name,
      })
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
          getBaseUrl() + "/payroll/paygroup",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
            "content-type":"application/json"
          }),

          data: {"group_name": group_name}

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }


  Future createPaygr(

      {String group_name,
      })
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
          getBaseUrl() + "/payroll/paygroup",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
            "content-type":"application/json"
          }),

          data: {"group_name": group_name}

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }

  Future paygroupUpdate({String id, String group_name}) async {

    try {
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      print('started request');
      var response = await Dio().put(
        getBaseUrl() + "/payroll/paygroup/$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          contentType: Headers.jsonContentType,
          validateStatus: (status) => true,
        ),

          data: {"group_name": group_name}


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  }

  Function deletePaygroup = (String Id) async {

    try {

      print('started request');

      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().delete(
        getBaseUrl() + "/payroll/paygroup/$Id",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

}
