import 'package:flutter/material.dart';
import './models/curricula.dart';
import './models/classes.dart';

const dummyClasses = [
  Classes(
    id: 'ca1',
    color: Colors.purple,
  ), //الصف الاول الابتدائي عربي
  Classes(
    id: 'ca2',
    color: Colors.red,
  ), //الصف الثاني الابتدائي عربي
  Classes(
    id: 'ca3',
    color: Colors.orange,
  ), //الصف الثالث الابتدائي عربي
  Classes(
    id: 'ca4',
    color: Colors.amber,
  ), //الصف الرابع الابتدائي عربي
  Classes(
    id: 'ca5',
    color: Colors.blue,
  ), //الصف الخامس الابتدائي عربي
  Classes(
    id: 'ca6',
    color: Colors.green,
  ), //الصف السادس الابتدائي عربي
  ////////////////////////////////////////
  Classes(
    id: 'cl1',
    color: Colors.purple,
  ), //الصف الاول الابتدائي لغات
  Classes(
    id: 'cl2',
    color: Colors.red,
  ), //الصف الثاني الابتدائي لغات
  Classes(
    id: 'cl3',
    color: Colors.orange,
  ), //الصف الثالث الابتدائي لغات
  Classes(
    id: 'cl4',
    color: Colors.amber,
  ), //الصف الرابع الابتدائي لغات
  Classes(
    id: 'cl5',
    color: Colors.blue,
  ), //الصف الخامس الابتدائي لغات
  Classes(
    id: 'cl6',
    color: Colors.green,
  ), //الصف السادس الابتدائي لغات
];

const dummyCurricula = [
  // الصف الاول الابتدائي
  Curricula(
    id: 'cu1a',
    curricula: [
      'ca1',
      'cl1',
    ],
    image:
        'https://12354655136.000webhostapp.com/first_grade_image/arabic_1prim_t2_photo.jpg',

    pdf:
        'https://12354655136.000webhostapp.com/first_grade_pdf/arabic_1prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.firstGrade,
    curriculaOfSchool: CurriculaOfSchool.arabic,
    links: [
      'https://www.youtube.com/watch?v=S74TdvR3zGU&list=PLmO7YhDrrq7BrYlqxfGpswD1g2pzfuURf',
      'https://www.youtube.com/watch?v=Jz7wUSbUJC8&list=PL3jaAblAPiYoBv217h-LG3UsJq8ah79ax',
      'https://www.youtube.com/watch?v=A6goLXJUPU0&list=PLSceolq2C1zMzbiL3ZIXGkE-TKSn2IUZe',
      'https://www.youtube.com/watch?v=aVw4jTdjjSo&list=PLLW9ZBeGrw3HDr0GT_Iff0lsJZSe6ct4-',
    ],
    //channel: 'https://www.youtube.com/watch?v=S74TdvR3zGU&list=PLmO7YhDrrq7BrYlqxfGpswD1g2pzfuURf',
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: true,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //عربي
  Curricula(
    id: 'cu1e',
    curricula: [
      'ca1',
      'cl1',
    ],
    image:
        'https://12354655136.000webhostapp.com/first_grade_image/english_1prim_t2_photo.jpg',
    pdf:
        'https://12354655136.000webhostapp.com/first_grade_pdf/english_1prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.firstGrade,
    curriculaOfSchool: CurriculaOfSchool.english,
    links: [
      'https://www.youtube.com/watch?v=zFsmTC9xcus&list=PL3jaAblAPiYr6mukWoNbm-KQejmffTu8_',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: true,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //انجليزي
  Curricula(
    id: 'cu1k',
    curricula: [
      'ca1',
    ],
    image:
        'https://12354655136.000webhostapp.com/first_grade_image/discover_1prim_t2_photo.jpg',
    pdf:
        'https://12354655136.000webhostapp.com/first_grade_pdf/discover_1prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.firstGrade,
    curriculaOfSchool: CurriculaOfSchool.actashfInArabic,
    links: [
      'https://www.youtube.com/watch?v=S74TdvR3zGU&list=PLmO7YhDrrq7BrYlqxfGpswD1g2pzfuURf',
      'https://www.youtube.com/watch?v=SEpOxdopqoo&list=PLSceolq2C1zPTO7TCWkHpqu8CA01FzU-q',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: true,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //اكتشف
  Curricula(
    id: 'cu1ke',
    curricula: [
      'cl1',
    ],
    image:
        'https://12354655136.000webhostapp.com/first_grade_image/dlscover_1prim_t2_e_photo.jpg',
    pdf:
        'https://12354655136.000webhostapp.com/first_grade_pdf/dlscover_1prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.firstGrade,
    curriculaOfSchool: CurriculaOfSchool.actashfInEnglish,
    links: [],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: true,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //Discover
  Curricula(
    id: 'cu1dm',
    curricula: [
      'ca1',
      'cl1',
    ],
    image:
        'https://12354655136.000webhostapp.com/first_grade_image/christian_1prim_t2_photo.jpg', pdf:
        'https://12354655136.000webhostapp.com/first_grade_pdf/christian_1prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.firstGrade,
    curriculaOfSchool: CurriculaOfSchool.masehy,
    links: [],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: true,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //دين مسيحي
  Curricula(
    id: 'cu1di',
    curricula: [
      'ca1',
      'cl1',
    ],
    image:
        'https://12354655136.000webhostapp.com/first_grade_image/islamy_1prim_t2_photo.jpg',
    pdf:
        'https://12354655136.000webhostapp.com/first_grade_pdf/islamy_1prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.firstGrade,
    curriculaOfSchool: CurriculaOfSchool.moslim,
    links: [],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: true,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //دين اسلامي
  // الصف الثاني الابتدائي
  Curricula(
    id: 'cu2a',
    curricula: [
      'ca2',
      'cl2',
    ],
    image:
        'https://12354655136.000webhostapp.com/second_grade_image/arabic_2prim_t2_photo.jpg',
    pdf:
        'https://12354655136.000webhostapp.com/second_grade_pdf/arabic_2prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.secondGrade,
    curriculaOfSchool: CurriculaOfSchool.arabic,
    links: [
      'https://www.youtube.com/watch?v=GK0FIyFiPa4&list=PLmO7YhDrrq7D6rNhDdStbMY9H0jD-lYWX',
      'https://www.youtube.com/watch?v=XXUAOf1pwz4&list=PLSceolq2C1zO98_D5NP8v5gLMkv3fXz-F',
      'https://www.youtube.com/watch?v=8w7JSfIRb4s&list=PLLW9ZBeGrw3GcQCDIZwDJyQYOl8bXKYjT',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: true,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //عربي
  Curricula(
    id: 'cu2e',
    curricula: [
      'ca2',
      'cl2',
    ],
    image:
        'https://12354655136.000webhostapp.com/second_grade_image/english_2prim_t2_photo.jpg',
    pdf:
        'https://12354655136.000webhostapp.com/second_grade_pdf/english_2prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.secondGrade,
    curriculaOfSchool: CurriculaOfSchool.english,
    links: [
      'https://www.youtube.com/watch?v=ROma1eSaaAQ&list=PLSceolq2C1zMiAzw9GxKmDas9WlpzrDjm',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: true,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //انجليزي
  Curricula(
    id: 'cu2ma',
    curricula: [
      'ca2',
    ],
    image:
        'https://12354655136.000webhostapp.com/second_grade_image/math_2prim_t2_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/second_grade_pdf/math_2prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.secondGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInArabic,
    links: [
      'https://www.youtube.com/watch?v=fVjorgblWyQ&list=PL3jaAblAPiYrWHUi-ecnZeSmQJhHsP3U7',
      'https://www.youtube.com/watch?v=h8BohDMsXgw&list=PLSceolq2C1zNMq7XFvn8bFUyP1YjDMeiZ',
      'https://www.youtube.com/watch?v=e-_TY4_mNHA&list=PLLW9ZBeGrw3HP2xY6ZgVqAwuLPb4NWA6r',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: true,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //رياضة
  Curricula(
    id: 'cu2me',
    curricula: [
      'cl2',
    ],
    image:
        'https://12354655136.000webhostapp.com/second_grade_image/math_2prim_t2_e_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/second_grade_pdf/math_2prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.secondGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInEnglish,
    links: [],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: true,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //ماث
  Curricula(
    id: 'cu2k',
    curricula: [
      'ca2',
    ],
    image:
        'https://12354655136.000webhostapp.com/second_grade_image/dlscove_2prim_t2_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/second_grade_pdf/dlscove_2prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.secondGrade,
    curriculaOfSchool: CurriculaOfSchool.actashfInArabic,
    links: [
      'https://www.youtube.com/watch?v=GK0FIyFiPa4&list=PLmO7YhDrrq7D6rNhDdStbMY9H0jD-lYWX',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: true,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //اكتشف
  Curricula(
    id: 'cu2ke',
    curricula: [
      'cl2',
    ],
    image:
        'https://12354655136.000webhostapp.com/second_grade_image/dlscove_2prim_t2_e_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/second_grade_pdf/dlscove_2prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.secondGrade,
    curriculaOfSchool: CurriculaOfSchool.actashfInEnglish,
    links: [],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: true,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //Discover
  Curricula(
    id: 'cu2di',
    curricula: [
      'ca2',
      'cl2',
    ],
    image:
        'https://12354655136.000webhostapp.com/second_grade_image/islamy_2prim_t2_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/second_grade_pdf/islamy_2prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.secondGrade,
    curriculaOfSchool: CurriculaOfSchool.masehy,
    links: [],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: true,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //دين اسلامي
  // الصف الثالث الابتدائي
  Curricula(
    id: 'cu3a',
    curricula: [
      'ca3',
      'cl3',
    ],
    image:
        'https://12354655136.000webhostapp.com/third_grade_image/arabic_3prim_t2_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/third_grade_pdf/arabic_3prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.thirdGrade,
    curriculaOfSchool: CurriculaOfSchool.arabic,
    links: [
      'https://www.youtube.com/watch?v=p3yJKSa5Qqk&list=PLmO7YhDrrq7ClF4l171pviqAA4UJwTj8w',
      'https://www.youtube.com/watch?v=HvjveKILsGM&list=PL3jaAblAPiYqwAfraAacveHAyBWR2wL8H',
      'https://www.youtube.com/watch?v=c_ocQC3Frno&list=PLSceolq2C1zPXYeMHJtawKZh8imOowAXM',
      'https://www.youtube.com/watch?v=_96Q40_Xunw&list=PLSceolq2C1zN209dfSdyotf0klzW6v-Zw',
      'https://www.youtube.com/watch?v=TNVe0ZzGQtA&list=PLLW9ZBeGrw3EuSjTU2svBwfEBsOL7zYLP',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: true,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //عربي
  Curricula(
    id: 'cu3e',
    curricula: [
      'ca3',
      'cl3',
    ],
    image:
        'https://12354655136.000webhostapp.com/third_grade_image/english_3prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/third_grade_pdf/english_3prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.thirdGrade,
    curriculaOfSchool: CurriculaOfSchool.english,
    links: [
      'https://www.youtube.com/watch?v=cpZCDber0Vw&list=PLSceolq2C1zOMv6jn-_l_VaFGzG7jNOLr',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: true,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //انجليزي
  Curricula(
    id: 'cu3ma',
    curricula: [
      'ca3',
    ],
    image:
        'https://12354655136.000webhostapp.com/third_grade_image/math_3prim_t2_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/third_grade_pdf/math_3prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.thirdGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInArabic,
    links: [
      'https://www.youtube.com/watch?v=7XU3cy7B4A0&list=PL3jaAblAPiYpunxfacsRKeHNYxbrOkf6Y',
      'https://www.youtube.com/watch?v=4lswYdcu_gU&list=PLSceolq2C1zPweo5fWqInSQsIsTqo5V4M',
      'https://www.youtube.com/watch?v=HcfvqqIyu9o&list=PLLW9ZBeGrw3GBCw_g4-jtsaxvjW6XFXdn',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: true,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //رياضة
  Curricula(
    id: 'cu3me',
    curricula: [
      'cl3',
    ],
    image:
        'https://12354655136.000webhostapp.com/third_grade_image/math_3prim_t2_e_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/third_grade_pdf/math_3prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.thirdGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInEnglish,
    links: [
      'https://www.youtube.com/watch?v=VMsO2HV0EPg&list=PL3jaAblAPiYqvXx0ynCyqLsLh3KQnQ3Co',
    ],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: true,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //ماث
  Curricula(
    id: 'cu3k',
    curricula: [
      'ca3',
    ],
    image:
        'https://12354655136.000webhostapp.com/third_grade_image/discover_3prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/third_grade_pdf/discover_3prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.thirdGrade,
    curriculaOfSchool: CurriculaOfSchool.actashfInArabic,
    links: [
      'https://www.youtube.com/watch?v=p3yJKSa5Qqk&list=PLmO7YhDrrq7ClF4l171pviqAA4UJwTj8w',
      'https://www.youtube.com/watch?v=_nxlijLkogA&list=PLSceolq2C1zORAQuCWLSi54cfXU9m1G97',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: true,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //اكتشف
  Curricula(
    id: 'cu3dm',
    curricula: [
      'ca3',
      'cl3',
    ],
    image:
        'https://12354655136.000webhostapp.com/third_grade_image/christian_3prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/third_grade_pdf/christian_3prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.thirdGrade,
    curriculaOfSchool: CurriculaOfSchool.masehy,
    links: [],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: true,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //دين مسيحي
  Curricula(
    id: 'cu3di',
    curricula: [
      'ca3',
      'cl3',
    ],
    image:
        'https://12354655136.000webhostapp.com/third_grade_image/islamy_3prim_t2_photo.jpg',
    pdf: 'https://12354655136.000webhostapp.com/third_grade_pdf/islamy_3prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.thirdGrade,
    curriculaOfSchool: CurriculaOfSchool.moslim,
    links: [
      'https://www.youtube.com/watch?v=FGvJC__imyQ&list=PLSceolq2C1zNKKVyDeKSube789tF3vEf8',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: true,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //دين اسلامي
  // الصف الرابع الابتدائي
  Curricula(
    id: 'cu4a',
    curricula: [
      'ca4',
      'cl4',
    ],
    image:
        'https://12354655136.000webhostapp.com/fourth_grade_image/arabic_4prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fourth_grade_pdf/arabic_4prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fourthGrade,
    curriculaOfSchool: CurriculaOfSchool.arabic,
    links: [
      'https://www.youtube.com/watch?v=CDqK6M1XN3g&list=PLZpdfXc71P-TyX0AufowHqm2xckiC0of4',
      'https://www.youtube.com/watch?v=Qs_B3vITKhU&list=PLmO7YhDrrq7A8C1QUkzZ94ocr32XhgHzR',
      'https://www.youtube.com/watch?v=prWqC2tR_FQ&list=PL3jaAblAPiYppTfdnYTEGhgt2rYKPwmWB'
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: true,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //عربي
  Curricula(
    id: 'cu4e',
    curricula: [
      'ca4',
      'cl4',
    ],
    image:
        'https://12354655136.000webhostapp.com/fourth_grade_image/english_4prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fourth_grade_pdf/english_4prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fourthGrade,
    curriculaOfSchool: CurriculaOfSchool.english,
    links: [
      'https://www.youtube.com/watch?v=_baoXFro-tQ&list=PLZpdfXc71P-ToI1Vz4_gRKCukBDkcwWym',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: true,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //انجليزي
  Curricula(
    id: 'cu4ma',
    curricula: [
      'ca4',
    ],
    image:
        'https://12354655136.000webhostapp.com/fourth_grade_image/math_4prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fourth_grade_pdf/math_4prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fourthGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInArabic,
    links: [
      'https://www.youtube.com/watch?v=yuJ7418x_bA&list=PLZpdfXc71P-QXIYQ8yU3jOcgi4ee9Df0P',
      'https://www.youtube.com/watch?v=4XiGRwt_rF4&list=PL3jaAblAPiYrz1wo969OxJigLl1mSnvbT'
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: true,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //رياضة
  Curricula(
    id: 'cu4sa',
    curricula: [
      'ca4',
    ],
    image:
        'https://12354655136.000webhostapp.com/fourth_grade_image/science_4prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fourth_grade_pdf/science_4prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fourthGrade,
    curriculaOfSchool: CurriculaOfSchool.scienceInArabic,
    links: [
      'https://www.youtube.com/watch?v=9hkGrJ3enCQ&list=PLZpdfXc71P-QvTNGkIJB2amBaODCj9Wn2',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: true,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //علوم
  Curricula(
    id: 'cu4se',
    curricula: [
      'cl4',
    ],
    image:
        'https://12354655136.000webhostapp.com/fourth_grade_image/science_4prim_t2_e_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fourth_grade_pdf/science_4prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.fourthGrade,
    curriculaOfSchool: CurriculaOfSchool.scienceInEnglish,
    links: [
      'https://www.youtube.com/watch?v=XuQ_Y3z-wNM&list=PLZpdfXc71P-SKcCO0su7H73QLzJQIP-Dt',
      'https://www.youtube.com/watch?v=nAJjgNPU-p0&list=PL3jaAblAPiYrdF_BNaGLcRF_I9oEsPCVF'
    ],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: true,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //ساينس
  Curricula(
    id: 'cu4d',
    curricula: [
      'ca4',
      'cl4',
    ],
    image:
        'https://12354655136.000webhostapp.com/fourth_grade_image/drasat_4prim_t1_t2_sb_wb_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fourth_grade_pdf/drasat_4prim_t1_t2_sb_wb.pdf',
    classesOfSchool: ClassesOfSchool.fourthGrade,
    curriculaOfSchool: CurriculaOfSchool.socialStudies,
    links: [
      'https://www.youtube.com/watch?v=Fv_afP71erU&list=PLZpdfXc71P-QgCyVp2RFstrj_av7OYeIT',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: true,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //دراسات
  Curricula(
    id: 'cu4di',
    curricula: [
      'ca4',
      'cl4',
    ],
    image:
        'https://12354655136.000webhostapp.com/fourth_grade_image/islamy_4prim_t1_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fourth_grade_pdf/islamy_4prim_t1.pdf',
    classesOfSchool: ClassesOfSchool.fourthGrade,
    curriculaOfSchool: CurriculaOfSchool.moslim,
    links: [],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: true,
    isFifthCurricula: false,
    isSixthCurricula: false,
  ), //دين اسلامي
  // الصف الخامس الابتدائي
  Curricula(
    id: 'cu5a',
    curricula: [
      'ca5',
      'cl5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/arabic_5prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/arabic_5prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.arabic,
    links: [
      'https://www.youtube.com/watch?v=wQTXMX2sEsA&list=PLZpdfXc71P-Q4x63odmmHzcdPayKuMTSG',
      'https://www.youtube.com/watch?v=nvedh0DgVy0&list=PLmO7YhDrrq7DJqcfF77q7Wvb2Pp7e3HS7',
      'https://www.youtube.com/watch?v=WVMjINxmTkI&list=PL3jaAblAPiYrqsXrszxNTMt5t9kr9sRAp'
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //عربي
  Curricula(
    id: 'cu5e',
    curricula: [
      'ca5',
      'cl5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/english_5prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/english_5prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.english,
    links: [
      'https://www.youtube.com/watch?v=R2laxd8aJOs&list=PLZpdfXc71P-RnChKTb08H_iY_msPijAfi',
      'https://www.youtube.com/watch?v=smGKZ2rGuGA&list=PL3jaAblAPiYpkBP6801FB1IKEkub2shBc'
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //انجليزي
  Curricula(
    id: 'cu5ma',
    curricula: [
      'ca5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/math_5prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/math_5prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInArabic,
    links: [
      'https://www.youtube.com/watch?v=hV6e8wi22Qk&list=PLZpdfXc71P-ToQwCRqGo8ugjpCdLUaz-O',
      'https://www.youtube.com/watch?v=pWPf7hWjnro&list=PL3jaAblAPiYpMu8sD5D-bdtdrx_49ACEx'
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //رياضة
  Curricula(
    id: 'cu5me',
    curricula: [
      'cl5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/math_5prim_t2_e_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/math_5prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInEnglish,
    links: [
      'https://www.youtube.com/watch?v=qt07CDUZjlk&list=PLZpdfXc71P-S967jGQE15yEsB43yphYyg',
      'https://www.youtube.com/watch?v=t--zzPdMTmU&list=PL3jaAblAPiYpanG6s0QvwLIPpb5fSDV_d',
    ],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //ماث
  Curricula(
    id: 'cu5sa',
    curricula: [
      'ca5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/science_5prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/science_5prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.scienceInArabic,
    links: [
      'https://www.youtube.com/watch?v=dtK9FXvtPwg&list=PLZpdfXc71P-QXKsUTgHL3x1qRaotabkWX',
      'https://www.youtube.com/watch?v=ItVNbWWTNk0&list=PL3jaAblAPiYocRys5rH-ThY7FQNu6kHsb',
      'https://www.youtube.com/watch?v=d75X5mfx8Kw&list=PL3jaAblAPiYrceZQd0lBjRpv1RTwuced4'
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //علوم
  Curricula(
    id: 'cu5se',
    curricula: [
      'cl5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/science_5prim_t2_e_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/science_5prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.scienceInEnglish,
    links: [
      'https://www.youtube.com/watch?v=RCUqG9vfsdM&list=PLZpdfXc71P-QforQi13O5v7fgdryDThao',
      'https://www.youtube.com/watch?v=oz14TgMkjlE&list=PL3jaAblAPiYoZo6L5kSLp0PxOZ30jhLRI'
    ],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //ساينس
  Curricula(
    id: 'cu5qa',
    curricula: [
      'ca5',
      'cl5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/story_5prim_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/story_5prim.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.story,
    links: [
      'https://www.youtube.com/watch?v=jNiLu12plb0&list=PLmO7YhDrrq7CIU1Mh-x0Jim3KT4G-CzlH',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //قصه عربي
  Curricula(
    id: 'cu5qi',
    curricula: [
      'ca5',
      'cl5',
    ],
    image:
        'https://12354655136.000webhostapp.com/fifth_grade_image/ibn_aof_5prim_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/fifth_grade_image/ibn_aof_5prim.pdf',
    classesOfSchool: ClassesOfSchool.fifthGrade,
    curriculaOfSchool: CurriculaOfSchool.storyInIslam,
    links: [],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: true,
    isSixthCurricula: false,
  ), //قصه اسلامي
  // الصف السادس الابتدائي
  Curricula(
    id: 'cu6a',
    curricula: [
      'ca6',
      'cl6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/arabic_6prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/arabic_6prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.arabic,
    links: [
      'https://www.youtube.com/watch?v=vY8gYPKeG2k&list=PLZpdfXc71P-TTntb4NT1LxgWgiJ52Pi-D',
      'https://www.youtube.com/watch?v=Gw4VkgZyVoI&list=PLmO7YhDrrq7Au10oCbAXRqRgwoUSwte8p',
      'https://www.youtube.com/watch?v=_-fy0fvV0-I&list=PL3jaAblAPiYojgCX7DgoosxAb4Q9zd23i',
      'https://www.youtube.com/watch?v=4CtmlAaU0_Q&list=PLSceolq2C1zOIygNfUCevBPYCyJr8wMm1',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //عربي
  Curricula(
    id: 'cu6e',
    curricula: [
      'ca6',
      'cl6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/english_6prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/english_6prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.english,
    links: [
      'https://www.youtube.com/watch?v=RBrRAb8rtwI&list=PLZpdfXc71P-THkXrdZgiX1GFRpiBLd-FT',
      'https://www.youtube.com/watch?v=SNWznb01YRA&list=PL3jaAblAPiYp9Pfx3uKfxbakcWaSzJoa2',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //انجليزي
  Curricula(
    id: 'cu6ma',
    curricula: [
      'ca6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/math_6prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/math_6prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInArabic,
    links: [
      'https://www.youtube.com/watch?v=RUPtQGAew1s&list=PLZpdfXc71P-TNXxcD4i7Ho9r6ReEiqXU6',
      'https://www.youtube.com/watch?v=iV1D6L9T4qM&list=PL3jaAblAPiYojNIsll0WiUzXTgyrdIgJY',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //رياضة
  Curricula(
    id: 'cu6me',
    curricula: [
      'cl6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/math_6prim_t2_e_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/math_6prim_t2_e.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.mathInEnglish,
    links: [
      'https://www.youtube.com/watch?v=FRD1YmV55IY&list=PLZpdfXc71P-Qha8Y2bocKNUTD6Mq4wGfk',
      'https://www.youtube.com/watch?v=ECJRVhWk0EU&list=PL3jaAblAPiYoUDAsk0uzdl4LNInTS2QmT',
    ],
    isArabicCurricula: false,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //ماث
  Curricula(
    id: 'cu6sa',
    curricula: [
      'ca6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/science_6prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/science_6prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.scienceInArabic,
    links: [
      'https://www.youtube.com/watch?v=hX9LluoBotk&list=PLZpdfXc71P-RJ2EMd0yAJVVDy7PwUoDar',
      'https://www.youtube.com/watch?v=HYkYO7seok0&list=PL3jaAblAPiYqcEVqEXytt4KSqs7MCJlLL',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: false,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //علوم
  Curricula(
    id: 'cu6d',
    curricula: [
      'ca6',
      'cl6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/drasat_6prim_t2_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/drasat_6prim_t2.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.socialStudies,
    links: [
      'https://www.youtube.com/watch?v=v6nWHmwayrw&list=PLZpdfXc71P-TAVlOciXJx_Ga8GsNZO27w',
      'https://www.youtube.com/watch?v=KvkR9euXMHA&list=PL3jaAblAPiYrob3Cvemn8eF5Woyn3D3Qq',
      'https://www.youtube.com/watch?v=6AwdxJdJxJg&list=PL3jaAblAPiYrFCQ22w6TxHUxkmO04nm1m',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //دراسات
  Curricula(
    id: 'cu6qa',
    curricula: [
      'ca6',
      'cl6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/story_6prim_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/story_6prim.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.story,
    links: [
      'https://www.youtube.com/watch?v=wU_-uXTfsys&list=PLmO7YhDrrq7AKsWgLOGWHN9otdDlGfGd0',
    ],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //قصه عربي
  Curricula(
    id: 'cu6qi',
    curricula: [
      'ca6',
      'cl6',
    ],
    image:
        'https://12354655136.000webhostapp.com/sixth_grade_image/story_islamy_6prim_photo.jpg',
    pdf: 'https://984654896351.000webhostapp.com/sixth_grade/story_islamy_6prim.pdf',
    classesOfSchool: ClassesOfSchool.sixthGrade,
    curriculaOfSchool: CurriculaOfSchool.storyInIslam,
    links: [],
    isArabicCurricula: true,
    isLanguagesCurricula: true,
    isFirstCurricula: false,
    isSecondCurricula: false,
    isThirdCurricula: false,
    isFourthCurricula: false,
    isFifthCurricula: false,
    isSixthCurricula: true,
  ), //قصه اسلامي
];
