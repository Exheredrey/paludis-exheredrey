dnl vim: set ft=m4 et :
dnl This file is used by Makefile.am.m4 and paludis.hh.m4. You should
dnl use the provided autogen.bash script to do all the hard work.

add(`about',                             `hh', `test')
add(`all_dep_atom',                      `hh', `cc')
add(`all_masked_error',                  `hh', `cc')
add(`ambiguous_package_name_error',      `hh', `cc')
add(`any_dep_atom',                      `hh', `cc')
add(`attributes',                        `hh', `cc')
add(`bad_version_spec_error',            `hh', `cc')
add(`block_dep_atom',                    `hh', `cc')
add(`block_error',                       `hh', `cc')
add(`category_name_part',                `hh', `cc')
add(`category_name_part_collection',     `hh', `cc')
add(`category_name_part_error',          `hh', `cc')
add(`category_name_part_validator',      `hh', `cc')
add(`circular_dependency_error',         `hh', `cc')
add(`comparison_policy',                 `hh', `cc', `test')
add(`composite_dep_atom',                `hh', `cc')
add(`composite_pattern',                 `hh', `cc')
add(`composite_visitor_pattern',         `hh', `cc', `impl')
add(`config_file',                       `hh', `cc', `test')
add(`config_file_error',                 `hh', `cc')
add(`container_entry',                   `hh', `cc', `test')
add(`counted_ptr',                       `hh', `cc', `test')
add(`counted_ptr_error',                 `hh', `cc')
add(`create_insert_iterator',            `hh', `cc', `test')
add(`default_config',                    `hh', `cc')
add(`default_config_error',              `hh', `cc')
add(`default_environment',               `hh', `cc')
add(`deleter',                           `hh', `cc', `test')
add(`dep_atom',                          `hh', `cc')
add(`dep_atom_dumper',                   `hh', `cc', `test')
add(`dep_atom_visitor',                  `hh', `cc')
add(`dep_lexer',                         `hh', `cc', `test')
add(`dep_list',                          `hh', `cc', `test')
add(`dep_list_entry',                    `hh', `cc')
add(`dep_list_error',                    `hh', `cc')
add(`dep_list_stack_too_deep_error',     `hh', `cc')
add(`dep_parser',                        `hh', `cc', `test')
add(`dep_string_error',                  `hh', `cc')
add(`dep_string_lex_error',              `hh', `cc')
add(`dep_string_nesting_error',          `hh', `cc')
add(`dep_string_parse_error',            `hh', `cc')
add(`dir_iterator',                      `hh', `cc')
add(`dir_open_error',                    `hh', `cc')
add(`duplicate_repository_error',        `hh', `cc')
add(`environment',                       `hh', `cc')
add(`exception',                         `hh', `cc')
add(`fake_repository',                   `hh', `cc')
add(`filter_insert_iterator',            `hh', `cc', `test')
add(`fs_entry',                          `hh', `cc', `test')
add(`fs_error',                          `hh', `cc')
add(`getenv',                            `hh', `cc', `test')
add(`indirect_iterator',                 `hh', `cc', `test')
add(`instantiation_policy',              `hh', `cc', `test')
add(`internal_error',                    `hh', `cc')
add(`is_const',                          `hh', `cc', `test')
add(`is_file_with_extension',            `hh', `cc', `test')
add(`join',                              `hh', `cc', `test')
add(`key_value_config_file',             `hh', `cc', `test')
add(`keyword_name',                      `hh', `cc')
add(`keyword_name_error',                `hh', `cc')
add(`keyword_name_validator',            `hh', `cc')
add(`line_config_file',                  `hh', `cc', `test')
add(`mask_reasons',                      `hh', `cc')
add(`name_error',                        `hh', `cc')
add(`no_resolvable_option_error',        `hh', `cc')
add(`no_such_package_error',             `hh', `cc')
add(`no_such_repository_error',          `hh', `cc')
add(`no_such_version_error',             `hh', `cc')
add(`package_database',                  `hh', `cc', `test')
add(`package_database_entry',            `hh', `cc')
add(`package_database_entry_collection', `hh', `cc')
add(`package_database_error',            `hh', `cc')
add(`package_database_lookup_error',     `hh', `cc')
add(`package_dep_atom',                  `hh', `cc')
add(`package_name_part',                 `hh', `cc', `test')
add(`package_name_part_collection',      `hh', `cc')
add(`package_name_part_error',           `hh', `cc')
add(`package_name_part_validator',       `hh', `cc')
add(`paludis',                           `hh', `cc')
add(`portage_repository',                `hh', `cc')
add(`private_implementation_pattern',    `hh', `cc')
add(`pstream',                           `hh', `cc', `test')
add(`pstream_error',                     `hh', `cc')
add(`pstream_in_buf',                    `hh', `cc')
add(`qualified_package_name',            `hh', `cc', `test')
add(`qualified_package_name_collection', `hh', `cc')
add(`qualified_package_name_error',      `hh', `cc')
add(`repository',                        `hh', `cc')
add(`repository_name',                   `hh', `cc')
add(`repository_name_collection',        `hh', `cc')
add(`repository_name_error',             `hh', `cc')
add(`repository_name_validator',         `hh', `cc')
add(`save',                              `hh', `cc', `test')
add(`sequential_collection',             `hh', `cc')
add(`smart_record',                      `hh', `cc', `test')
add(`slot_name',                         `hh', `cc')
add(`slot_name_error',                   `hh', `cc')
add(`slot_name_validator',               `hh', `cc')
add(`sorted_collection',                 `hh', `cc')
add(`stringify',                         `hh', `cc', `test')
add(`strip',                             `hh', `cc', `test')
add(`tokeniser',                         `hh', `cc', `test')
add(`test_environment',                  `hh', `cc')
add(`translate_insert_iterator',         `hh', `cc', `test')
add(`use_dep_atom',                      `hh', `cc')
add(`use_flag_name',                     `hh', `cc')
add(`use_flag_name_error',               `hh', `cc')
add(`use_flag_name_validator',           `hh', `cc')
add(`validated',                         `hh', `cc', `test')
add(`version_metadata',                  `hh', `cc')
add(`version_operator',                  `hh', `cc', `test')
add(`version_spec',                      `hh', `cc', `test')
add(`version_spec_collection',           `hh', `cc')
add(`visitor_pattern',                   `hh', `cc', `impl', `test')

