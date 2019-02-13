package Calendar::Dates;

# DATE
# VERSION

1;
# ABSTRACT: Modules that contain calendar dates

=head1 SPECIFICATION VERSION

0.1

=head1 DESCRIPTION

The C<Calendar::Dates::*> namespace is reserved for modules that provide
calendar dates using a common interface. The interface is designed to be: simple
to implement, lightweight, and easy to use and export (e.g. to an iCal
calendar).

Conventions for subdivision under the C<Calendar::Dates::> namespace:

=over

=item * Country-specific calendars go to <XX>::*, where <XX> is the ISO3166-1 2-letter country code

Examples:

  Calendar::Dates::SG::Events
  Calendar::Dates::SG::FestivalsEvents
  Calendar::Dates::ID::Tax

=item * Country-specific (public) holiday calendars go to XX::Holiday::*

Examples:

 Calendar::Dates::US::Holiday

=item * Region/province- and locality-specific calendars go to <CC>::<Name>::*

Examples:

 Calendar::Dates::ID::Jakarta::Events

=item * Year number can be added as the last component if the module only supports a specific year

Examples:

 Calendar::Dates::ID::Holiday::2019

=item * Religion-related calendars go to Religion::<Name>::*

Examples:

 Calendar::Dates::Religion::Christianity

=item * Sports-related calendars go to Sports::*

Examples:

 Calendar::Dates::Sports::WTA
 Calendar::Dates::Sports::WTA::2019
 Calendar::Dates::ID::Jakarta::Sports::Marathon

=back


=head1 METHODS

=head2 get_min_year

Usage:

 my $min_year = Calendar::Dates::Foo->get_min_year;

Return the earliest year that the module has dates for. See also
L</get_max_year>. Note that the module might not support some years between the
earliest and latest years.

=head2 get_max_year

Usage:

 my $max_year = Calendar::Dates::Foo->get_max_year;

Return the latest year that the module has dates for. See also L</get_min_year>.
Note that the module might not support some years between the earliest and
latest years.

=head2 get_entries

Usage:

 my $records = Calendar::Dates::Foo->get_entries($year [, $mon [, $day ] ]);

Return entries for a particular year (or month, or day). Method must die if year
(or month, or day) is not supported. Entries are arrayref, where each entry is a
L<DefHash>. The following keys are recognized, an asterisk (C<*>) signifies
required key (see L<DefHash> for more details on each key):

=over

=item * date*

String. Either ISO8601 date in the format C<< YYYY-MM-DD >> or C<<
YYYY-MM-DD"T"HH:MM >> or date interval in the format of C<<
YYYY-MM-DD"T"HH:MM/HH:MM >>.

Examples:

 2019-02-13
 2019-02-13T07:00
 2019-02-13T07:00/09:00

Interval that spans day is currently not allowed. You might want to create
separate entries for each day in the span.

Timezones are not currently allowed. Dates are assumed in the local time zone.

=item * year*

Integer. Year number (e.g. 2019).

=item * month*

Integer. Month number (1-12).

=item * day*

Integer. Day of month number (1-31).

=item * summary

From DefHash specification. Should be in English. To specify summary in other
language, use "summary.alt.lang.<LL>" keys.

=item * description

From DefHash specification. Should be in English. To specify description in
other language, use "description.alt.lang.<LL>" keys.

=item * tags

From DefHash specification. Some recommended/known tags: tentative, holiday,
religious.

=item * url

URL.

=item * image_url

URL.

=item * is_holiday

Boolean. You can also use tag C<holiday> to mark an entry as a holiday.

=back


=head1 SEE ALSO

C<Calendar::DatesUtils> namespace for modules that make use of
C<Calendar::Dates::*> modules, e.g. L<Calendar::DatesUtils::To::ICal>.

C<Calendar::DatesRoles> namespace.

L<App::CalendarDatesUtils> which contain utilities like L<list-calendar-dates>,
etc.
