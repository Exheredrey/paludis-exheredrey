/* vim: set sw=4 sts=4 et foldmethod=syntax : */

/*
 * Copyright (c) 2005, 2006 Ciaran McCreesh <ciaranm@gentoo.org>
 *
 * This file is part of the Paludis package manager. Paludis is free software;
 * you can redistribute it and/or modify it under the terms of the GNU General
 * Public License version 2, as published by the Free Software Foundation.
 *
 * Paludis is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include <test/test_framework.hh>
#include <test/test_runner.hh>
#include "all_dep_atom.hh"
#include "any_dep_atom.hh"
#include "use_dep_atom.hh"
#include "package_dep_atom.hh"
#include "dep_atom_visitor.hh"
#include "dep_atom_dumper.hh"
#include <sstream>

using namespace test;
using namespace paludis;

/** \file
 * Test cases for DepAtomDumper.
 *
 * \ingroup Test
 */

namespace test_cases
{
    /**
     * \test Test DepAtomDumper.
     *
     * \ingroup Test
     */
    struct DepAtomDumperTest : TestCase
    {
        DepAtomDumperTest() : TestCase("dump") { }

        void run()
        {
            std::stringstream s;
            DepAtomDumper d(&s);
            AllDepAtom::Pointer all(new AllDepAtom);
            PackageDepAtom::Pointer p1(new PackageDepAtom(make_qualified_package_name("one/one")));
            AnyDepAtom::Pointer any(new AnyDepAtom);
            PackageDepAtom::Pointer p2(new PackageDepAtom(make_qualified_package_name("two/two")));
            PackageDepAtom::Pointer p3(new PackageDepAtom(make_qualified_package_name("three/three")));
            all->add_child(p1);
            all->add_child(any);
            any->add_child(p2);
            any->add_child(p3);
            all->accept(&d);
            TEST_CHECK_EQUAL(s.str(), "<all><package>one/one</package>"
                    "<any><package>two/two</package><package>three/three</package></any></all>");
        }
    } test_dep_atom_dumper;
}
