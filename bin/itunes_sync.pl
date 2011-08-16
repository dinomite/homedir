#!/usr/bin/env perl
use warnings;
use strict;
use Getopt::Long;
use Pod::Usage;

my $rsync = 'rsync';

=head1 NAME

itunes_sync.pl - Sync an iTunes library & associated files

=head1 SYNOPSIS

itunes_sync.pl [options] user remote_host

=head1 OPTIONS

=over 4

=item B<-help>

This help message

=item B<-remote>

Remote iTunes directory (default: /Users/<user>/Music/iTunes)

=item B<-local>

Local iTunes directory (default: /Users/<user>/Music/iTunes)

=item B<-bwlimit>

Bandwidth limit

=item B<-nopodcast>

Don't copy the the podcasts/ directory

=item B<-nolibrary>

Don't copy the iTunes library file

=back

=cut

my $help = 0;
my $remoteDir = '';
my $localDir = '';
my $bwLimit = 0;
my $noPodcast = 0;
my $noLibrary = 0;

GetOptions( 'help|h'    => \$help,
            'remote=s'  => \$remoteDir,
            'local=s'   => \$localDir,
            'bwlimit=i' => \$bwLimit,
            'nopodcast' => \$noPodcast,
            'nolibrary' => \$noLibrary);
pod2usage(1) if ($help);

my $user = $ARGV[0];
my $host = $ARGV[1];
pod2usage(1) unless (defined $host && defined $user);

# Set the default diretories if not specified on command line
$remoteDir = "/Users/$user/Music/iTunes" unless ($remoteDir ne '');
$localDir = "/Users/$user/Music/iTunes" unless ($localDir ne '');

# Why --whole-file?
# --size-only because of metadata changes?
my $rsyncOptions = "-a --delete --progress --rsh=ssh --exclude='.DS_Store' --exclude='*.DS_Store'";
$rsyncOptions .= " --bwlimit $bwLimit" if ($bwLimit);
$rsyncOptions .= " --exclude=Podcasts/***" if ($noPodcast);

unless ($noLibrary) {
    system("scp \"$user" . "@" . "$host:$remoteDir/iTunes\\ Library.itl\" $localDir/");
}

# Album Artwork
system("$rsync $rsyncOptions --exclude=\'Cache/*\' ".
    "\"$user" . "@" . "$host:$remoteDir/Album\\ Artwork/\" ".
    "\"$localDir/Album Artwork/\"");

# Mobile Applications
system("$rsync $rsyncOptions ".
    "\"$user". "@" . "$host:$remoteDir/Mobile\\ Applications/\" ".
    "\"$localDir/Mobile Applications/\"");

# The actual music
system("$rsync $rsyncOptions ".
    "\"$user" . "@" . "$host:$remoteDir/iTunes\\ Music/\" ".
    "\"$localDir/iTunes Music/\"");
