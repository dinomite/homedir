#!/usr/bin/env perl
use warnings;
use strict;
use 5.010;
use Cwd;

my $usage = "Usage: $0 language directory\n";
die $usage unless ($#ARGV == 1);

my $lang = $ARGV[0];
my $dir = $ARGV[1];

my $taggenFile = 'tags-gen';
my $tagFile = 'tags';

### Commands for ctags
my $ctags = '/usr/local/bin/ctags';
# http://weierophinney.net/matthew/archives/134-exuberant-ctags-with-PHP-in-Vim.html
my $php = $ctags . ' -a -h ".php" -R ' .
        '--exclude="*\.svn" --exclude="*\.js" ' .
        '--exclude="*\.jar" --exclude="*\.css" ' .
        '--exclude="*db/archive/*" '.
        '--exclude="*test/jsUnit/framework/env-js*" '.
        '--totals=yes --PHP-kinds=+cf ' .
        "--regex-PHP='/abstract class ([^ ]*)/\1/c/' " .
        "--regex-PHP='/interface ([^ ]*)/\1/c/' " .
        "--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' ";

# http://arun.wordpress.com/2009/04/10/c-and-vim/
my $csharp = $ctags . ' -R --exclude="bin" --extra=+fq --fields=+ianmzS ' .
            '--c#-kinds=cimnp ';

my $genCMD;
given ($ARGV[0]) {
    when ('csharp') {$genCMD= $csharp}
    when ('php') {$genCMD= $php}
}

#my $outfile = "$dir/$taggenFile.output";
#open STDOUT, ">>$outfile" or die "Can't write to $outfile: $!";
#open STDERR, ">>$outfile" or die "Can't write to $outfile: $!";

system $genCMD . "-f $dir/$taggenFile $dir > /dev/null";
system "mv -f $dir/$taggenFile $dir/$tagFile";
#system "cp -f $dir/$taggenFile $dir/$tagFile";
#system "rm $dir/$taggenFile";
system "chmod 400 $dir/$tagFile";

#my @tagDirs = ('~/dev1/code/trunk', '~/dev1/code/21', '~/dev1/code/21.1');
