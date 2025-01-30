<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\courses;
use App\Models\lessons;
use App\Models\order;
use App\Models\cart;
use Illuminate\Support\Facades\Session;
class HomeController extends Controller
{
    //
    public function logout(){
        Auth::logout();
        return view('front.home');
    }

    public function redirect(){
     $usertype=Auth::user()->user_type;
     /* dd($usertype); */
     if($usertype==0){
        $user_id=Auth::user()->id;
        $cart=order::where('o_user_id','=',$user_id)->get();
        $cart_count=$cart->count();
        session(['cart_count' => $cart_count]);
        return view('front.home',compact('cart_count','cart'))->with('cart',$cart_count);
     }
     else
     {
        return  view('admin.index');
     }

    }
    /* show_cart */
    public function show_cart(){
        $user_id=Auth::user()->id;
        $data=order::where('o_user_id','=',$user_id)->get();
      
        return view('front.show_cart',compact('data','user_id'));
        }

    /* add_order */
    public function add_order($id){
        if(Auth::check()){
        $user_id=Auth::user()->id; 
        $user_data=user::find($user_id);

        $course_id=$id;

        $course_data= courses::find($id);
         $order_data= new order;
         $order_data->o_user_id=$user_id;
         $order_data->o_course_id=$course_id;
         $order_data->o_course_name=$course_data->course_name;
         $order_data->o_price=$course_data->course_price;
         $order_data->o_pay="no";
         $order_data->o_status="suspend";
         $order_data->save();

        
        $cart=order::where('o_user_id','=',$user_id)->get();
        $cart_count=$cart->count();
        session(['cart_count' => $cart_count]);
       
        return redirect()->back();
        }
         else
         {
            return redirect()->route('login');
         }
    }
/* show_student */
public function show_student(){
    if(Auth::check()){
        $user_id=Auth::user()->id; 
    $user_data=user::find($user_id);
    $data=cart::where('o_user_id','=',$user_id)->get();
    return view('front.student',compact('user_data','data'));
    }
    else
    {
        return redirect()->route('login');
    }
    }
    /* pay */
public function pay ($id){
    return view ('front.pay');

}
    /* add_cart_data */
    public function add_cart_data(Request $request){
       
       
            $user_id=$request->uid;
            
            $order_data=order::where('o_user_id','=',$user_id)->get();
         
          
            
            foreach ($order_data as $item){
            $new_cart= new cart;
            $new_cart->o_course_id=$item->o_course_id;
            $new_cart->o_course_name=$item->o_course_name;
            $new_cart->o_user_id=$item->o_user_id;
            $new_cart->o_price=$item->o_price;
            $new_cart->o_pay=$item->o_pay;
            $new_cart->o_status=$item->o_status;
            $new_cart->method=$request->cash;
            $new_cart->save();
            $item->delete(); 
            }
            $cart_count=0;
            session(['cart_count' => $cart_count]);
          $data=cart::where('o_user_id','=',$user_id)->get();
          $user_data=user::find($user_id);
          
          return view ('front.student',compact('user_data','data'));
        
    }

        /* delete_order */
        public function delete_order($id){
            $order_data=order::where('o_user_id','=', $id);
            $order_data->delete();
            $d_count=0;
            session(['cart_count' => $d_count]);
            return redirect()->back();
            }

            /* delete_single_order */
            public function delete_single_order($id){
                $data=order::find( $id);
                $data->delete();
                $new_count=(Session::get('cart_count'))-1;
                
                session(['cart_count' => $new_count]);
                return redirect()->back();
                }

                /* delete_single_cart */
                public function delete_single_cart($id){
                    $data=cart::find( $id);
                    $data->delete();
                  
                    return redirect()->back();
                    }

    /*  */

    public function index(){
        return view('front.home');
    }

    /* about */
    public function about(){
        return view('front.about');
    }
    /* courses */
    public function show_courses(){
        $data=courses::all();
        return view('front.courses',compact('data'));
    }
    /* course_detailes */
    public function course_detailes($id){
        $data=courses::find($id);
        return view('front.course_detailes',compact('data'));
        }
    /* course_lessons */
    public function course_lessons($id){
        $data=lessons::where('course_id','=',$id)->get();
        return view('front.course_lessons',compact('data'));
        }
    /* ourteam */
    public function ourteam(){
        return view('front.ourteam');
    }

    /* contact */
    public function contact(){
        return view('front.contact');
    }

}
