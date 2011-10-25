package RangeAWS;

use Amazon::EC2::Client;
use Amazon::EC2::Model::DescribeInstancesRequest;

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
    my $request = Amazon::EC2::Model::DescribeInstancesRequest->new;
    my @result = invokeDescribeInstances($service, $request);
    return @result;
}

sub invokeDescribeInstances {
    my ($service, $request) = @_;
    my $response = $service->describeInstances($request);
    if ($response->isSetDescribeInstancesResult()) {
	my $describeInstancesResult = $response->getDescribeInstancesResult();
	my $instanceList = $describeInstancesResult->getInstanceId();
	return @$instanceList;
    } else {
	return [];
    }
}
	    
1;
