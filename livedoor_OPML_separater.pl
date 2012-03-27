#!/usr/bin/perl 
use strict;
use warnings;
use XML::Simple;
#use YAML;
use Encode qw/ encode_utf8 /;
#use File::Copy;

my $opml = 'export.xml'; 
my $rData = XMLin($opml);
#my @opml_files;

for my $outline1 ($rData->{body}->{outline}) {
	for my $outline2 ($outline1->{outline}){
		for my $outline3 (@$outline2){
			my $opml_title =  $outline3->{title};
			my $opml_file = "./opml/" .$opml_title .".opml";
			print "modeified opml_file is ". encode_utf8($opml_file) ."\n";
			open my $fh, '>', $opml_file;
#			push (@opml_files, $opml_file);
			print $fh encode_utf8(XMLout($outline3, RootName => 'body'));
		}
	}
};

#for my $file (@opml_files){
# 	if (copy $file, 'temp.opml'){
#		print "copy succeed ".encode_utf8($file)." to 'temp.opml'\n";
#		print "excute plagger\n";
#		system("/usr/bin/plagger/plagger -c LdrOPML2Popfile2Elsewhere.yaml")
#	}
#}

	
