<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\teachers;
use App\Models\categories;
use App\Models\courses;
use App\Models\homework;
use App\Models\lessons;
use App\Models\order;
use App\Models\cart;
use Illuminate\Support\Facades\Session;
class AdminController extends Controller
{
    //
    public function showusers(){
        $data=user::all();
  
    
        return view('admin.users',compact('data'));
    }

    /* delete_user */
    public function delete_user($id){
        $data1=user::find($id);
       
        $data1->delete();
        return redirect()->back()->with('message','user is deleted..');
    }

    /* edit_user */
    public function edit_user($id){
        $data2=user::find($id);
       
        return view('admin.edit_user',compact('data2'));
       
    }

     /* $o_id=order::where('id','=',$o_id)->get(); */
        /* $idd=$data2->orderNo;
        
        $data3=bank::where('order_id','=',"$idd")->first();
      
        $data3->delete(); */

    /* showteachers */
    public function showteachers(){
        $t_data=teachers::all();
        return view('admin.teachers',compact('t_data'));
    }
    /* showcat */
    public function showcat(){
        $data=categories::all();
        return view('admin.cat',compact('data'));
    }
    /* showcourses */
    public function showcourses(){
      $c_data=courses::all();
        return view('admin.courses',compact('c_data'));
        }

        /* showlessons */
        public function showlessons(){
          $data=lessons::all();
            return view('admin.lessons',compact('data'));
        }
        /* showhomeworks */
        public function showhomeworks(){
          
          $data =homework::all();
            return view('admin.homeworks',compact ('data'));
        }
        /* showgrades */
        public function showgrades(){   
        }
        /* add_teachers */
        public function add_teachers(){
            return view('admin.add_teachers');
            }

            /* add_tech_data */
    public function add_tech_data(Request $request){
        $tech_data=new teachers();
        $tech_data->t_name=$request->tech_name;
        $tech_data->t_email=$request->tech_email;
        $tech_data->t_mobile=$request->tech_mobile;
        $tech_data->t_address=$request->tech_address;
      
        $tech_data->t_password=$request->tech_pass;
        $tech_data->t_majority=$request->tech_mj;
      
      /* load image start */
      
      if($request->tech_image!=null){
        
        $image1=$request->tech_image;
        $image_name=time().'.'.$image1->getClientOriginalExtension();
        $request->tech_image->move('t_images',$image_name);
        $tech_data->t_image=$image_name;

        }
       
      /* end image */
      
      /* load cv start */

      if($request->tech_cv!=null){
       
      $file=$request->tech_cv;
      $file_name=time().'.'.$file->getClientOriginalExtension();
      $request->tech_cv->move('t_cv',$file_name);
      $tech_data->t_cv=$file_name;
      }
     
        /* end cv */
            $tech_data->save();
        
  return redirect()->back()->with('message','Teachers are Added..');
 
     }
        /* add_cat */
        public function add_cat(){
            return view('admin.add_cat');
            }
            /* add_courses */
        public function add_courses(){
            $cat_data=categories::all();
            $tech_data=teachers::all();
                return view('admin.add_courses',compact('cat_data','tech_data'));
                }
       
                    /* add_homeworks */
        public function add_homeworks(){
          $co_data=courses::all();
          $tech_data=teachers::all();
          return view('admin.add_homeworks',compact('co_data','tech_data'));
               
           }
                        /* add_grades */
        
        /* add_post_cat */
        public function add_post_cat(Request $request){

            $cat_data=new categories();
            $cat_data->cat_name=$request->cat_name;
            $cat_data->cat_desc=$request->cat_desc;
            


       /* upload image */
       if($request->cat_image!=null){
        
      $file=$request->cat_image;
      $file_name=time().'.'.$file->getClientOriginalExtension();
      $request->cat_image->move('cat_images',$file_name);
      $cat_data->cat_image=$file_name;
      
  
      

      }
      
       
           $cat_data->save();
           
           

           return redirect()->back()->with('message','Cat Added sccessfully'); 


           
            }

             /* add_lessons */
             public function add_lessons( ){
                $co_data=courses::all();
                return view ('admin.add_lessons',compact('co_data'));
        
            }
    /* add_homework_data */
    public function add_homework_data(Request $request){
      $h_data=new homework();
      $h_data->course_id=$request->co_id;
      $h_data->teacher_id=$request->t_id;
      $h_data->h_title=$request->h_title;
      $h_data->h_desc=$request->h_desc;
      $h_data->h_start_date=$request->start_date;
      $h_data->h_end_date=$request->end_date;
 
    /* load image start */
    
    if($request->h_image!=null){
      
      $image1=$request->h_image;
      $image_name=time().'.'.$image1->getClientOriginalExtension();
      $request->h_image->move('homework_images',$image_name);
      $h_data->h_image=$image_name;

      }
     
    /* end image */

        /* load pdf start */
    
        if($request->h_pdf!=null){
      
          $pdf1=$request->h_pdf;
          $pdf_name=time().'.'.$pdf1->getClientOriginalExtension();
          $request->h_pdf->move('homework_pdf',$pdf_name);
          $h_data->h_pdf=$pdf_name;
  
          }
         
        /* end pdf */



          $h_data->save();
  

return redirect()->back()->with('message','Homework are Added..');


   }

     /* add_lessons_data */
     public function add_lessons_data(Request $request){
        $l_data=new lessons();
        $l_data->course_id=$request->co_id;
        $l_data->l_title=$request->l_title;
        $l_data->l_desc=$request->l_desc;
      
   
      /* load image start */
      
      if($request->l_image!=null){
        
        $image1=$request->l_image;
        $image_name=time().'.'.$image1->getClientOriginalExtension();
        $request->l_image->move('lessons_images',$image_name);
        $l_data->l_image=$image_name;

        }
       
      /* end image */
       
      
      /* load video start */
      
      if($request->l_video!=null){
        
        $video1=$request->l_video;
        $video_name=time().'.'.$video1->getClientOriginalExtension();
        $request->l_video->move('lessons_video',$video_name);
        $l_data->l_video=$video_name;

        }
       
      /* end video */
          /* load pdf start */
      
          if($request->l_pdf!=null){
        
            $pdf1=$request->l_pdf;
            $pdf_name=time().'.'.$pdf1->getClientOriginalExtension();
            $request->l_pdf->move('lessons_pdf',$pdf_name);
            $l_data->l_pdf=$pdf_name;
    
            }
           
          /* end pdf */
    /* load audio start */
      
    if($request->l_audio!=null){
        
        $audio1=$request->l_audio;
        $audio_name=time().'.'.$audio1->getClientOriginalExtension();
        $request->l_audio->move('lessons_audio',$audio_name);
        $l_data->l_audio=$audio_name;

        }
       
      /* end audio */


            $l_data->save();
    
 
  return redirect()->back()->with('message','Lessons are Added..');
 
 
     }
/* show_orders */
public function show_orders(){
  $data=cart::all();
  return view('admin.show_orders',compact('data'));

}
/* active_course */
public function active_course($id){
  $active=cart::find($id);
  $active->o_status="active";
  $active->o_pay="Paid";
  $active->save();
  $data=cart::all();
  return redirect()->back()->with('message','course are active..');

}
/* deactive_course */
public function deactive_course($id){
  $active=cart::find($id);
  $active->o_status="suspend";
  $active->save();
  $data=cart::all();
  return redirect()->back()->with('message','course are active..');

}
/* delete_order */
public function delete_order($id){
  $active=cart::find($id);
 
  $active->delete();
  $data=cart::all();
  return redirect()->back()->with('message','course are deleted..');
}

/* edit_user_post */
public function edit_user_post(Request $request){

    
    $id=$request->u_id;
    $user_data=user::find($id);

    $user_data->name=$request->u_name;
    $user_data->email=$request->u_email;
    $user_data->address=$request->u_address;
    $user_data->mobile=$request->u_mobile;
   
  if($request->u_image!=null){
    
    $image1=$request->u_image;
    $image_name=time().'.'.$image1->getClientOriginalExtension();
    $request->u_image->move('images',$image_name);
    $user_data->image=$image_name;

    }
   
  /* end image */
  
 
    /* end cv */
        $user_data->save();
    
   return redirect()->back()->with('message','Users are Updated..');

 }
                
    /* edit_teacher */ 
    public function edit_teacher($id){
        $teacher_data=teachers::find($id);
        return view('admin.edit_teacher',compact('teacher_data'));

    }

    /* edit_teacher_post */

    public function edit_teacher_post(Request $request){
       $id=$request->t_id;
        $tech_data=teachers::find($id);

        $tech_data->t_name=$request->t_name;
        $tech_data->t_email=$request->t_email;
        $tech_data->t_mobile=$request->t_mobile;
        $tech_data->t_address=$request->t_address;
      
        $tech_data->t_password=$request->t_password;
        $tech_data->t_majority=$request->t_mj;
      
      /* load image start */
      
      if($request->t_image!=null){
        
        $image1=$request->t_image;
        $image_name=time().'.'.$image1->getClientOriginalExtension();
        $request->t_image->move('t_images',$image_name);
        $tech_data->t_image=$image_name;

        }
       
      /* end image */
      
      /* load cv start */

      if($request->t_cv!=null){
       
      $file=$request->t_cv;
      $file_name=time().'.'.$file->getClientOriginalExtension();
      $request->t_cv->move('t_cv',$file_name);
      $tech_data->t_cv=$file_name;
      }
     
        /* end cv */
            $tech_data->save();
        
  return redirect()->back()->with('message','Teachers are Updated..');
 
     }

     /* delete_teacher */
     public function delete_teacher($id){
        $data1=teachers::find($id);
       
        $data1->delete();
        return redirect()->back()->with('message','Teachers is deleted..');
    }
    /* delete_course */
    public function delete_course($id){
      $data1=courses::find($id);
     
      $data1->delete();
      return redirect()->back()->with('message','Course is deleted..');
  }
    /* delete_homework */
    public function delete_homework($id){
      $data1=homework::find($id);
     
      $data1->delete();
      return redirect()->back()->with('message','Homework is deleted..');
  }
  /* delete_lesson */
  public function delete_lesson($id){
    $data1=lessons::find($id);
   
    $data1->delete();
    return redirect()->back()->with('message','lessons is deleted..');
}

    /* add_course_data */
    public function add_courses_data(Request $request){
        $courses_data=new courses();
        $courses_data->course_name=$request->course_name;
        $courses_data->course_code=$request->course_code;
        $courses_data->course_desc=$request->course_desc;
        $courses_data->course_price=$request->course_price;
        $courses_data->course_duration=$request->course_duration;
        $courses_data->course_level=$request->course_level;
       /*  $courses_data->course_lessons_number=$request->course_lessons_number; */
        $courses_data->cat_id=$request->cat_id;
        $courses_data->teacher_id=$request->teacher_id;
   
      /* load image start */
      
      if($request->course_image!=null){
        
        $image1=$request->course_image;
        $image_name=time().'.'.$image1->getClientOriginalExtension();
        $request->course_image->move('course_images',$image_name);
        $courses_data->course_image=$image_name;

        }
       
      /* end image */

            $courses_data->save();
    
 
  return redirect()->back()->with('message','courses are Added..');
 
 
     }


}
