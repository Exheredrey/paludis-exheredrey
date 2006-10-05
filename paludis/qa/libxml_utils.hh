/* vim: set sw=4 sts=4 et foldmethod=syntax : */

/*
 * Copyright (c) 2006 Ciaran McCreesh <ciaranm@ciaranm.org>
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

#ifndef PALUDIS_GUARD_PALUDIS_QA_LIBXML_UTILS_HH
#define PALUDIS_GUARD_PALUDIS_QA_LIBXML_UTILS_HH 1

#include <libxml/parser.h>
#include <string>

namespace paludis
{
    namespace qa
    {
        template <typename PtrType_>
        class LibXmlPtrHolder
        {
            private:
                PtrType_ _ptr;
                void (* _free_func) (PtrType_);

                LibXmlPtrHolder(const LibXmlPtrHolder &);
                void operator= (const LibXmlPtrHolder &);

            public:
                LibXmlPtrHolder(PtrType_ ptr, void (* free_func) (PtrType_)) :
                    _ptr(ptr),
                    _free_func(free_func)
                {
                }

                ~LibXmlPtrHolder()
                {
                    if (0 != _ptr)
                        _free_func(_ptr);
                }

                operator PtrType_ () const
                {
                    return _ptr;
                }
        };

        std::string
        retarded_libxml_string_to_string(const xmlChar * s);
    }
}


#endif
