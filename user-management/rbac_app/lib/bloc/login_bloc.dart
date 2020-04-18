import 'package:bloc/bloc.dart';
import 'package:rbacapp/bloc/login_event.dart';
import 'package:rbacapp/bloc/login_state.dart';
import 'package:rbacapp/dio_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  @override
  // TODO: implement initialState
  LoginState get initialState => Waiting();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
   if (event is Login){
     try{
//       yield Loading();
       final result = await dioService.postLogin(event.username, event.password);
       yield Success(data:result);
     }
     catch(e){
       if(e.response.statusCode == 401){
         yield Error();
       }else{
         print(e.message);
         print(e.request);
       }
     }
   } else if (event is GetModule){
     try{
       yield Loading();
       final result = await dioService.getModule();
       yield Success(data: result);
     }
     catch(e){
       print(e);
     }
   }
  }

}