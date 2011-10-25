package LibrangeUtils;

use Amazon::EC2::Client;

my $AWS_ACCESS_KEY_ID        = q(AKIAJVMKABQKHBE574MQ);
my $AWS_SECRET_ACCESS_KEY    = q(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);

sub functions_provided {
    return qw/ami/;
}

sub ami {
    my ( $rr, $range ) = @_;
    my $AWS_ACCESS_KEY_ID        = q(AKIAJVMKABQKHBE574MQ);
    my $AWS_SECRET_ACCESS_KEY    = q(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);
    my $conf = {ServiceURL => "https://us-west-1.ec2.amazonaws.com"};
    my $service = Amazon::EC2::Client->new($AWS_ACCESS_KEY_ID,
					   $AWS_SECRET_ACCESS_KEY,
					   $conf);
    invokeDescribeImages($service, $request->withImageId("ami-971945d2"));

    my @result = map { s/\.inktomisearch\.com//; $_ } @$range;
    return @result;
}

sub invokeDescribeImages {
    my ($service, $request) = @_;
    if ($response->isSetDescribeImagesResult()) {
	my $describeImagesResult = $response->getDescribeImagesResult();
	my $imageList = $describeImagesResult->getImage();
	return @$imageList;
    } else {
	return [];
    }
}
	    
1;
