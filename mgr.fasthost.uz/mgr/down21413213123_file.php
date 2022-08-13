<?php
$filename = ''.htmlspecialchars($_GET['filename']);
 // иначе Internet Explorer будет игнорировать Content-Disposition 
    if(ini_get('zlib.output_compression'))
    ini_set('zlib.output_compression', 'Off');
    $file_extension = strtolower(substr(strrchr($filename,"."),1));
  
    if( $filename == "" )
     {
    echo "Xato, Fayl ismini ko\'rsating!";
    exit;
     } elseif ( ! file_exists( $filename ) ) // проверяем файл на существование
     {
       echo "Xato: ushbu fayl mavjud emas!";
       exit;
       };
    switch( $file_extension )
     {
          case "pdf": $ctype="application/pdf"; break;
          case "exe": $ctype="application/octet-stream"; break;
          case "zip": $ctype="application/zip"; break;
          case "doc": $ctype="application/msword"; break;
          case "xls": $ctype="application/vnd.ms-excel"; break;
          case "ppt": $ctype="application/vnd.ms-powerpoint"; break;
          case "mp3": $ctype="audio/mp3"; break;
          case "gif": $ctype="image/gif"; break;
          case "png": $ctype="image/png"; break;  
          case "jpeg": $ctype="image/jpeg"; break;
          case "jpg": $ctype="image/jpg"; break;
          default: $ctype="application/force-download";
    }
    header("Pragma: public"); 
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("Cache-Control: private",false); // нужен для Explorer
    header("Content-Type: $ctype");
    header("Content-Disposition: attachment; filename=\"www.Fasthost.Uz_".basename($filename)."\";" );
    header("Content-Transfer-Encoding: binary");
    // нужно сделать подсчет размера файла его пути
    header("Content-Length: ".filesize($filename));
    readfile("$filename");
    exit();
        
?>