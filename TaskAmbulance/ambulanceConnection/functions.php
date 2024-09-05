<?php
define('MB',1048576);
function filterRequest($requestName){
  return  htmlspecialchars(strip_tags($_POST[$requestName]));
}
function filterRequestGet($requestName){
    return  htmlspecialchars(strip_tags($_GET[$requestName]));
  }
function imageUpload($imageRequest,$path)
{
    global $msgError;
$imageName=rand(1,10000) .$_FILES[$imageRequest]["name"];
$imageTemp=$_FILES[$imageRequest]["tmp_name"];
$imageSize=$_FILES[$imageRequest]["size"];
$allowExt=array("jpg","png","gif","jepg");
$strToArray=explode(".",$imageName);
$ext=end($strToArray);
$ext=strtolower($ext);
if(empty($imageName) && !in_array($ext,$allowExt))
{
$msgError[]='EXT';
}
if($imageSize >2* MB)
{
    $msgError[]="size";
}
if(empty($msgError))
{
    move_uploaded_file($imageTemp,'img/'.$path.$imageName);
    return $imageName;
}
else{
    return "fail";
}

}
function deleteFile($dirction,$imagename)
{
if(file_exists($dirction."/".$imagename))
{
    unlink($dirction."/".$imagename);
}
}