package Calendar::DatesRoles::PublicInterface::Basic;

use Role::Tiny;

requires 'get_min_year';
requires 'get_max_year';
requires 'get_entries';

1;
# ABSTRACT: Basic public interface of Calendar::Dates
