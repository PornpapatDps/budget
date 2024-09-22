#"อ่านก่อนทำ"
--------------

แอพรายรับรายจ่าย
-----------------------------------------
โจทย์ที่ได้รับ
 1. ต้องการสามารถบันทึกรายรับรายจ่ายได้
    สิ่งที่เราจะทำ : เราจะทำเป็นหน้าบันทึกรายรับรายจ่าย (ยังไม่สมบูรณ์)
 2. สร้างงบประมาณ 
    สิ่งที่เราจะทำ : เราจะทำเป็นหน้ากำหนดงบประมาณ (ยังไม่สมบูรณ์)
 3. แสดงรายการสรุปเงินประจำเดือน 
    สิ่งที่เราจะทำ : เราจะทำเป็นกราฟแสดงทั้งหมด 8เดือน  (ยังไม่สมบูรณ์)
----------------------
######################################################################

Flutter version  : 
    Flutter 3.24.3 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision 2663184aa7 (11 days ago) • 2024-09-11 16:27:48 -0500
    Engine • revision 36335019a8
    Tools • Dart 3.5.3 • DevTools 2.37.3
    
การใช้API : 
    การเรียกใช้API ปัจจุบันจะเรียกผ่าน pubspec.yaml เอามาจาก pub.dev 
    จะใช้วิธีimport หรือใช้ flutter pub add <ชื่อApiที่จะใช้>

######################################################################

ภายใน Folder libจะมี
    1 main.dart 
        หน้ารันแอพพลิเคชั่นทั้งหมด
    2 app.dart 
        หน้าสำหรับไปรายรับหรือรายจ่าย
    3 app_view.dart
        กำหนดธีมสี title ข้างบนแท็บwindow
    4 Folder: data
         4.1 data.dart
            ข้อมูลการแสดงผล อารมณ์ .json 
    5 Folder: screens 
        5.0. ไฟล์ manage_budget.dart
        กำหนดงบประมาณ ***ยังไม่สมบูรณ์***
         5.1. add_expense_income
                โฟเดอร์เก็บหน้ารายรับ-รายจ่าย
                - add_expense.dart
                    หน้ารายจ่าย จะมีฟังก์ชั่น 1.เพิ่มจำนวนเงิน 
                    2.บันทึกรายละเอียดสามารถเลือกชื่อ icon สีiconได้ ***มีบัคต้องกดข้างนอก1ครั้งถึงiconและสีของiconติด**
                    3.เลือกหมวดหมู่
                    4.กำหนดวันที่ 
                - add_income.dart
                    หน้ารายรับ จะมีฟังก์ชั่น 1.เพิ่มจำนวนเงิน 
                    2.บันทึกรายละเอียดสามารถเลือกชื่อได้
                    3.กำหนดวันที่ 
         5.2. home
            - home_screen.dart
                ปุ่มด้านล่าง
            - main_screen.dart
                หน้าแรกหน้าหลัก จะมีฟังก์ชั่น คือ จะแสดงธุรกรรมที่ โดยดึงข้อมูลจากไฟล์ data.dart
         5.3. stats
            - chart.dart
                ข้อมูลกราฟ จะไปดึงมาจากไฟล์ data.dart
            - stats.dart
                หน้าแสดงภาพกราฟ

---------------------------------------------------------------------------------- 

ปล.สามารถปรับแก้โค้ดได้เลย /ไม่ชอบตรงไหนปรับแต่งแก้ไขได้เลย/ตั้งแต่ Folder add_expense_income ไม่ได้ทำตามคลิปแล้วเพราะiconไม่ขึ้น

----------------------------------------------------------------------------------
