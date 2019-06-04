//长度检查
function fucCheckLength(strTemp)
{
 var i,sum;
 sum=0;
 for(i=0;i<strTemp.length;i++)
 {
  if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))
   sum=sum+1;
  else
   sum=sum+2;
 }
 return sum;
}

//空格检查
function chkspc(a)
{
 var i=a.length;
 var j = 0;
 var k = 0;
 while (k<i)
 {
  if (a.charAt(k) != " ")
   j = j+1;
  k = k+1;
 }
 if (j==0)
 {
  return 0;
 }
 
 if (i!=j)
 { return 2; }
 else
 {
  return 1;
 }
}