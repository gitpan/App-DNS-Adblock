
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A DNS based implementation of Adblock Plus",
  "AUTHOR" => "David Watson <dwatson\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Data::Dumper" => 0,
    "Net::DNS::Resolver" => 0,
    "Test" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-DNS-Adblock",
  "EXE_FILES" => [
    "scripts/adblock.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::DNS::Adblock",
  "PREREQ_PM" => {
    "App::DNS::Adblock" => 0,
    "Capture::Tiny" => 0,
    "Carp" => 0,
    "Getopt::Long" => 0,
    "LWP::Simple" => 0,
    "Mozilla::CA" => 0,
    "Net::DNS" => 0,
    "Net::DNS::Nameserver" => 0,
    "POSIX" => 0,
    "Pod::Usage" => 0,
    "Sys::HostIP" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



