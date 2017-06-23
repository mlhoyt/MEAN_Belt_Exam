# -*- perl -*-

$GET = "-X GET";
$POST = "-X POST";
$PUT = "-X PUT";
$DELETE = "-X DELETE";

$URL  = "http://localhost:8000";

$HEADER_CONTENT_TYPE_JSON = "--header 'Content-Type: application/json'";

######################################################################

sub send
{
  my( $method, $url, $data ) = @_;

  my @cmd = ( "curl", ${method}, ${url} );
  push @cmd, ${HEADER_CONTENT_TYPE_JSON}, ${data} if( $data ne "" );

  printf STDERR "%s\n", ('*' x 80);
  printf STDERR "Test: %s\n", join( " ", @cmd );
  system( sprintf( "%s | python -m json.tool", join( " ", @cmd ) ) );
  printf STDERR "%s\n", ('*' x 80);
}

######################################################################

# &send( ${POST}, "${URL}/api/categories", "--data '{\"name\":\"Web Fundamentals\"}'" );
# &send( ${POST}, "${URL}/api/categories", "--data '{\"name\":\"Python Django\"}'" );
# &send( ${POST}, "${URL}/api/categories", "--data '{\"name\":\"JavaScript MEAN\"}'" );
# &send( ${POST}, "${URL}/api/categories", "--data '{\"name\":\"Swift iOS\"}'" );
# &send( ${POST}, "${URL}/api/categories", "--data '{\"name\":\"Ruby On Rails\"}'" );

%category = (
  'Web Fundamentals' => "594c41dea75e3489bc0e04de",
  'Python Django'    => "594c41e0a75e3489bc0e04df",
  'JavaScript MEAN'  => "594c41e0a75e3489bc0e04e0",
  'Swift iOS'        => "594c41e0a75e3489bc0e04e1",
  'Ruby On Rails'    => "594c41e0a75e3489bc0e04e2",
);

######################################################################

# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"Joe\"}'" );
# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"sphinx\"}'" );
# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"the_one\"}'" );
# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"Zen\"}'" );
# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"KB\"}'" );
# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"Oliver\"}'" );
# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"Mark\"}'" );
# &send( ${POST}, "${URL}/api/users", "--data '{\"name\":\"Charles\"}'" );

%user = (
  'Joe'     => "594c440ba75e3489bc0e04e3",
  'sphinx'  => "594c440ba75e3489bc0e04e4",
  'the_one' => "594c440ba75e3489bc0e04e5",
  'Zen'     => "594c440ba75e3489bc0e04e6",
  'KB'      => "594c521f99586f8b47053a9a",
  'Oliver'  => "594c522099586f8b47053a9b",
  'Mark'    => "594c522099586f8b47053a9c",
  'Charles' => "594c522099586f8b47053a9d",
);

######################################################################

# $data = sprintf( "--data '{\"title\":\"Best/easiest way to encrypt password?\",\"text\":\"What is the best/easiest way to encrypt a password?\",\"_user\":\"$user{'Joe'}\",\"_category\":\"$category{'Ruby On Rails'}\"}'" );
# &send( ${POST}, "${URL}/api/topics", $data );

# $data = sprintf( "--data '{\"title\":\"Database structure\",\"text\":\"ORMs are the way to go for database structure!\",\"_user\":\"$user{'sphinx'}\",\"_category\":\"$category{'Python Django'}\"}'" );
# &send( ${POST}, "${URL}/api/topics", $data );

# $data = sprintf( "--data '{\"title\":\"How to make my website user-friendly?\",\"text\":\"I like the look of my website but how do I make it more UX friendly?\",\"_user\":\"$user{'the_one'}\",\"_category\":\"$category{'JavaScript MEAN'}\"}'" );
# &send( ${POST}, "${URL}/api/topics", $data );

# $data = sprintf( "--data '{\"title\":\"What is the first thing you should learn if you want to be a web developer\",\"text\":\"Any tip on what I should learn first and what are the things that I should keep in mind.  Thanks!\",\"_user\":\"$user{'Zen'}\",\"_category\":\"$category{'Web Fundamentals'}\"}'" );
# &send( ${POST}, "${URL}/api/topics", $data );

%topic = (
  'password' => "594c4679a75e3489bc0e04e8",
  'database' => "594c502499586f8b47053a97",
  'ux_friendly' => "594c502699586f8b47053a98",
  'first_thing' => "594c502699586f8b47053a99",
);

######################################################################

# $data = sprintf( "--data '{\"text\":\"You have to remember that you should never stop learning :)\",\"_user\":\"$user{'KB'}\",\"_topic\":\"$topic{'first_thing'}\"}'" );
# &send( ${POST}, "${URL}/api/posts", $data );

# $data = sprintf( "--data '{\"text\":\"Just learn the basics.\",\"_user\":\"$user{'Mark'}\",\"_topic\":\"$topic{'first_thing'}\"}'" );
# &send( ${POST}, "${URL}/api/posts", $data );

%post = (
  'keep_learning' => "594c963dce86d58d3bd83492",
  'learn_basics'  => "594c963dce86d58d3bd83493",
);

######################################################################

$data = sprintf( "--data '{\"text\":\"I strongly agree!\",\"_user\":\"$user{'Oliver'}\",\"_post\":\"$post{'keep_learning'}\"}'" );
&send( ${POST}, "${URL}/api/comments", $data );

$data = sprintf( "--data '{\"text\":\"Keep your mind open to new things.\",\"_user\":\"$user{'Charles'}\",\"_post\":\"$post{'keep_learning'}\"}'" );
&send( ${POST}, "${URL}/api/comments", $data );

$data = sprintf( "--data '{\"text\":\"I like that answer. :)\",\"_user\":\"$user{'Zen'}\",\"_post\":\"$post{'learn_basics'}\"}'" );
&send( ${POST}, "${URL}/api/comments", $data );

