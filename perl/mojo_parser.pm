# @date: 2012-12-26
# @author: Roman Bogatov

use Mojo::DOM ;
use Time::HiRes qw/time/ ;

$f=`cat $ARGV[0]`;
$s=time();
$xpath_enable = ($ARGV[2] =~ /true/);
$linkCount = 0;

for ( $i = 0 ; $i < $ARGV[1] ; $i = $i + 1 ) {
  $dom = Mojo::DOM->new($f);
  if($xpath_enable)
  {
    $linkCount = $dom->find('a')->size;
  }
}
print time()-$s, " s\n";
if($xpath_enable)
{
  print $linkCount, " links\n";
}