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

#ifndef PALUDIS_GUARD_PALUDIS_QUALIFIED_PACKAGE_NAME_HH
#define PALUDIS_GUARD_PALUDIS_QUALIFIED_PACKAGE_NAME_HH 1

#include <paludis/package_name_part.hh>
#include <paludis/category_name_part.hh>
#include <paludis/smart_record.hh>
#include <ostream>

namespace paludis
{
    /**
     * Keys for a QualifiedPackageName.
     */
    enum QualifiedPackageNameKeys
    {
        qpn_category,         ///< The CategoryNamePart part
        qpn_package,          ///< The PackageNamePart part
        last_qpn              ///< Number of values
    };

    /**
     * Tags for a QualifiedPackageName.
     */
    struct QualifiedPackageNameTag :
        SmartRecordTag<comparison_mode::FullComparisonTag, comparison_method::SmartRecordCompareByAllTag>,
        SmartRecordKeys<QualifiedPackageNameKeys, last_qpn>,
        SmartRecordKey<qpn_category, CategoryNamePart>,
        SmartRecordKey<qpn_package, PackageNamePart>
    {
    };

    /**
     * A QualifiedPackageName instance holds a CategoryNamePart and
     * a PackageNamePart.
     */
    typedef MakeSmartRecord<QualifiedPackageNameTag>::Type QualifiedPackageName;

    /**
     * Output a QualifiedPackageName to a stream.
     */
    std::ostream & operator<< (std::ostream &, const QualifiedPackageName &);

    /**
     * Create a QualifiedPackageName from a string.
     */
    QualifiedPackageName make_qualified_package_name(const std::string &);
}

#endif
