#!/bin/bash
# vim: set ft=sh sw=4 sts=4 et :

mkdir e_repository_TEST_dir || exit 1
cd e_repository_TEST_dir || exit 1

mkdir -p vdb
touch vdb/THISISTHEVDB

mkdir -p build

mkdir -p distdir
echo "already fetched" > distdir/already-fetched.txt || exit 1

mkdir -p fetchable
echo "one" > fetchable/fetchable-1.txt || exit 1
echo "two" > fetchable/fetchable-2.txt || exit 1

mkdir -p repo1/{eclass,distfiles,profiles/profile} || exit 1
cd repo1 || exit 1
echo "test-repo-1" > profiles/repo_name || exit 1
cat <<END > profiles/categories || exit 1
cat-one
cat-two
cat-three
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cd ..

mkdir -p repo2/{eclass,distfiles,profiles/profile} || exit 1
cd repo2 || exit 1
cat <<END > profiles/categories || exit 1
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cd ..


mkdir -p repo3/{eclass,distfiles,profiles/profile} || exit 1
cd repo3 || exit 1
echo "# test-repo-3" > profiles/repo_name || exit 1
cat <<END > profiles/categories || exit 1
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cd ..


mkdir -p repo4/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo4/{cat-one/{pkg-one,pkg-both},cat-two/{pkg-two,pkg-both}} || exit 1
cd repo4 || exit 1
echo "test-repo-4" > profiles/repo_name || exit 1
cat <<END > profiles/categories || exit 1
cat-one
cat-two
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > cat-one/pkg-one/pkg-one-1.ebuild || exit 1
END
cat <<END > cat-one/pkg-one/pkg-one-1.1-r1.ebuild || exit 1
END
cat <<END > cat-one/pkg-both/pkg-both-3.45.ebuild || exit 1
END
cat <<END > cat-two/pkg-two/pkg-two-2.ebuild || exit 1
END
cat <<END > cat-two/pkg-both/pkg-both-1.23.ebuild || exit 1
END
cd ..


mkdir -p repo5/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo5/cat-one/{pkg-one,pkg-1,pkg.one} || exit 1
cd repo5 || exit 1
echo "test-repo-5" > profiles/repo_name || exit 1
cat <<END > profiles/categories || exit 1
cat-one
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > cat-one/pkg-one/pkg-one-1.ebuild || exit 1
END
cat <<END > cat-one/pkg-1/pkg-1-1.ebuild || exit 1
END
cat <<END > cat-one/pkg.one/pkg.one-1.ebuild || exit 1
END
cd ..


mkdir -p repo6/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo6/cat-one/pkg-one || exit 1
mkdir -p repo6/metadata/cache/cat-one
cd repo6 || exit 1
echo "test-repo-6" > profiles/repo_name || exit 1
cat <<END > profiles/categories || exit 1
cat-one
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > cat-one/pkg-one/pkg-one-1.ebuild || exit 1
END
cat <<END > metadata/cache/cat-one/pkg-one-1
the/depend
the/rdepend
the-slot
the-src-uri
the-restrict
the-homepage
the-license
the-description
the-keywords

the-iuse
unused
the/pdepend
the/provide
0
END
cd ..


mkdir -p repo7/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo7/cat-one/{stale-pkg,pkg-{one,two}} || exit 1
mkdir -p repo7/metadata/cache/cat-{one,two}
cd repo7 || exit 1
echo "test-repo-7" > profiles/repo_name || exit 1
cat <<END > profiles/categories || exit 1
cat-one
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > cat-one/pkg-one/pkg-one-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND="foo/bar"
END
cat <<"END" > cat-one/pkg-one/pkg-one-2.ebuild || exit 1
inherit mine
DESCRIPTION="dquote \" squote ' backslash \\ dollar \$"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND="foo/bar"
END
cat <<END > eclass/mine.eclass
DEPEND="bar/baz"
END
cat <<END > eclass/stale.eclass
END
cat <<END > cat-one/pkg-two/pkg-two-1.ebuild || exit 1
i am a fish
END

cat <<END > cat-one/stale-pkg/stale-pkg-1.ebuild || exit 1
DESCRIPTION="The Generated Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
cat <<END > metadata/cache/cat-one/stale-pkg-1
the/depend
the/rdepend
the-slot
the-src-uri
the-restrict
the-homepage
the-license
The Stale Description
the-keywords

the-iuse
unused
the/pdepend
the/provide
0
END
touch -t 199901010101 metadata/cache/cat-one/stale-pkg-1 || exit 2

cat <<END > cat-one/stale-pkg/stale-pkg-2.ebuild || exit 1
inherit stale

DESCRIPTION="The Generated Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
cat <<END > metadata/cache/cat-one/stale-pkg-2
the/depend
the/rdepend
the-slot
the-src-uri
the-restrict
the-homepage
the-license
The Stale Description
the-keywords
stale
the-iuse
unused
the/pdepend
the/provide
0
END
touch -t 199901010101 metadata/cache/cat-one/stale-pkg-2 || exit 2
cd ..

mkdir -p repo8/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo8/{cat-one/{pkg-one,pkg-both},cat-two/{pkg-two,pkg-both}} || exit 1
cd repo8 || exit 1
echo "test-repo-8" > profiles/repo_name || exit 1
cat <<END > profiles/categories || exit 1
cat-one
cat-two
END
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > cat-one/pkg-one/pkg-one-1.ebuild || exit 1
END
cat <<END > cat-one/pkg-one/pkg-one-1-monkey.ebuild || exit 1
END
cat <<END > cat-one/pkg-one/pkg-one-1.1-r1.ebuild || exit 1
END
cat <<END > cat-one/pkg-both/pkg-both-3.45.ebuild || exit 1
END
cat <<END > cat-one/pkg-both/pkg-both-3.45_r1.ebuild || exit 1
END
cat <<END > cat-two/pkg-two/pkg-two-2.ebuild || exit 1
END
cat <<END > cat-two/pkg-both/pkg-both-1.23.ebuild || exit 1
END
cat <<END > cat-two/pkg-both/pkg-both-.ebuild || exit 1
END
cd ..


mkdir -p repo9/{eclass,distfiles,profiles/profile,cat-one/pkg-one,cat-two/pkg-one} || exit 1
mkdir -p repo9/{cat-one/pkg-one,cat-two/pkg-two} || exit 1
cd repo9 || exit 1
echo "test-repo-9" > profiles/repo_name || exit 1
cat <<END >profiles/categories || exit 1
cat-one
cat-two
END
cat <<END > profiles/arch.list || exit 1
test
test2
END
cat <<END >profiles/profile/make.defaults || exit 1
ARCH=test
USE="flag1 flag2 flag3 -flag4 -flag5"
END
cat <<END >profiles/profile/use.mask || exit 1
flag2
END
cat <<END >profiles/profile/use.force || exit 1
flag4
END
cat <<END >profiles/profile/package.use.mask || exit 1
cat-two/pkg-two flag3
>=cat-one/pkg-one-2 flag3
END
cat <<END >profiles/profile/package.use.force || exit 1
cat-two/pkg-two flag5
END
cat <<END > cat-one/pkg-one/pkg-one-1.ebuild || exit 1
END
cat <<END > cat-one/pkg-one/pkg-one-2.ebuild || exit 1
END
cat <<END > cat-two/pkg-two/pkg-two-1.ebuild || exit 1
END
cd ..

mkdir -p repo10/{eclass,distfiles,profiles/profile/subprofile,cat/masked,cat/not_masked,cat/was_masked} || exit 1
cd repo10 || exit 1
echo "test-repo-10" > profiles/repo_name || exit 1
cat <<END >profiles/profiles.desc || exit 1
test profile stable
test profile/subprofile stable
END
cat <<END >profiles/profile/make.defaults || exit 1
ARCH=test
USE="flag1 flag2 flag3 -flag4 -flag5"
END
cat <<END >profiles/categories || exit 1
cat
END
cat <<END >profiles/profile/package.mask
cat/masked
cat/was_masked
END
cat <<END >profiles/profile/subprofile/package.mask
-cat/was_masked
END
cat <<END >profiles/profile/subprofile/parent
..
END
cat <<END > cat/masked/masked-0.ebuild
KEYWORDS="test"
END
cat <<END > cat/not_masked/not_masked-0.ebuild
KEYWORDS="test"
END
cat <<END > cat/was_masked/was_masked-0.ebuild
KEYWORDS="test"
END
cd ..

mkdir -p repo11/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo11/category/package{,-b}/files || exit 1
cd repo11 || exit 1
echo "test-repo-11" >> profiles/repo_name || exit 1
echo "category" >> profiles/categories || exit 1
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > category/package/package-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="foo"
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
cat <<END > category/package/package-2.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="bar"
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
cat <<END > category/package/ChangeLog || exit 1
The times, they are-a changin'...
END
cat <<END > category/package/metadata.xml || exit
This isn't valid xml & I don't care!
END
cat <<END > category/package/files/some.patch || exit 1
+ Manifest2
END
echo "something" > distfiles/foo || exit 1
echo "for nothing" > distfiles/bar || exit 1
cat <<END > Manifest_correct || exit 1
AUX some.patch 12 RMD160 e7f53a2bea1265ef55ae5494ef6050ff7fd1a900 SHA1 eaa98a50a0db46d8ab1b02aacbfe511ea2273234 SHA256 26955b4e2d4f60561b8002b72c34ce266f534a4f32f13a29aa33875d39d31cc4
DIST bar 12 RMD160 90bd2a71cf9d8cf744b0afc0e9a00b999bb59f72 SHA1 f27a44461791182539e3d22516148b1e5289fdce SHA256 27cd06afc317a809116e7730736663b9f09dd863fcc37b69d32d4f5eb58708b2
DIST foo 10 RMD160 9e19cc1527a061585aa02dae8b7f4047dcd16275 SHA1 50a4e988380c09d290acdab4bd53d24ee7b497df SHA256 4bc453b53cb3d914b45f4b250294236adba2c0e09ff6f03793949e7e39fd4cc1
EBUILD package-1.ebuild 134 RMD160 0a59df8f246cd5d9f83b89b36026701f1bfe235b SHA1 ba3e8f6f99abdd220fc9d51c6370e4f29f8c74af SHA256 4d58e5622889397ff6a257d87652a8220585c4d97efbf0a42bf59b3f75d19e03
EBUILD package-2.ebuild 134 RMD160 d8149a3828ea05849c7033c431d3df5c6eaab67d SHA1 8ae9fc2476191906c8827b42ca86279d6fa0aead SHA256 3fb00f77d96c3e6576c2d424d31023958b507bdf20eb6555e89a135b37a54c07
MISC ChangeLog 34 RMD160 64ae4731e1de8dc8d81f0504c22e586358a5b6f0 SHA1 4de9269f6cdd0cf97c11c4a552cf3764301f40c0 SHA256 a8dfbbc187c93c0731fa9722aff87c437a4b9f59b1786d62651fb104b0c3ed97
MISC metadata.xml 37 RMD160 52a6de8e54eeea3b5e3e8357a400fbc6d3f4062b SHA1 071fb2cfe08b9fa1816ec14d65d2e9099810b552 SHA256 ba3b181b832c002612fba7768c95e526e188658d8fc85b92c153940ad43169de
END
cat <<END > category/package-b/package-b-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="fooz"
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
cd ..

mkdir -p repo12/{profiles/profile,metadata} || exit 1
cd repo12 || exit 1
echo "test-repo-12" >> profiles/repo_name || exit 1
echo "cat" >> metadata/categories.conf || exit 1
cat <<END > profiles/profile/make.defaults
END
mkdir -p packages/cat/no-files
cat <<END > packages/cat/no-files/no-files-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
mkdir -p packages/cat/fetched-files
cat <<END > packages/cat/fetched-files/fetched-files-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="file:///var/empty/already-fetched.txt"
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
mkdir -p packages/cat/fetchable-files
cat <<END > packages/cat/fetchable-files/fetchable-files-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="file:///$(dirname $(pwd ) )/fetchable/fetchable-1.txt"
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
mkdir -p packages/cat/arrow-files
cat <<END > packages/cat/arrow-files/arrow-files-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="file:///$(dirname $(pwd ) )/fetchable/fetchable-1.txt -> arrowed.txt"
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
mkdir -p packages/cat/unfetchable-files
cat <<END > packages/cat/unfetchable-files/unfetchable-files-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="file:///var/empty/unfetchable-file.txt"
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
mkdir -p packages/cat/no-files-restricted
cat <<END > packages/cat/no-files-restricted/no-files-restricted-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
mkdir -p packages/cat/fetched-files-restricted
cat <<END > packages/cat/fetched-files-restricted/fetched-files-restricted-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="manual: file:///var/empty/already-fetched.txt"
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
mkdir -p packages/cat/fetchable-files-restricted
cat <<END > packages/cat/fetchable-files-restricted/fetchable-files-restricted-1.exheres-0 || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="manual: file:///$(dirname $(pwd ) )/fetchable/fetchable-2.txt"
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"
DEPENDENCIES=""
END
cd ..

mkdir -p repo13/{profiles/profile,metadata,eclass} || exit 1
cd repo13 || exit 1
echo "test-repo-13" >> profiles/repo_name || exit 1
echo "cat" >> profiles/categories || exit 1
cat <<END > profiles/profile/virtuals
virtual/virtual-pretend-installed cat/pretend-installed
virtual/virtual-doesnotexist cat/doesnotexist
END
cat <<END > profiles/profile/make.defaults
ARCH="test"
USERLAND="GNU"
KERNEL="linux"
LIBC="glibc"
CHOST="i286-badger-linux-gnu"
PALUDIS_COMMAND="/bin/false"
END
mkdir -p "cat/in-ebuild-die"
cat <<END > cat/in-ebuild-die/in-ebuild-die-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"

pkg_setup() {
    die "boom"
}
END
mkdir -p "cat/in-subshell-die"
cat <<END > cat/in-subshell-die/in-subshell-die-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"

pkg_setup() {
    ( hasq test \$KEYWORDS && die "boom" )
}
END
mkdir -p "cat/success"
cat <<END > cat/success/success-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

pkg_setup() {
    useq spork && die "boom"
}
END
mkdir -p "cat/unpack-die"
cat <<END > cat/unpack-die/unpack-die-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

src_unpack() {
    echo "123" > f.bz2
    unpack ./f.bz2
}
END
mkdir -p "cat/emake-fail"
cat <<END > cat/emake-fail/emake-fail-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

src_compile() {
    emake monkey
}
END
mkdir -p "cat/pretend-installed"
cat <<END > cat/pretend-installed/pretend-installed-2.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

src_compile() {
    die "not supposed to install this"
}
END
mkdir -p "cat/econf-source"
cat <<END > cat/econf-source/econf-source-0.ebuild || exit 1
EAPI="\${PV}"
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

src_unpack() {
    ECONF_SOURCE=subdir
    mkdir \${S}
    cd \${S}
    mkdir subdir
    echo 'touch monkey' > subdir/configure
    chmod +x subdir/configure
}

src_install() {
    insinto /usr/bin
    doins monkey || die "no monkey"
}
END
cp cat/econf-source/econf-source-{0,1}.ebuild || exit 1
mkdir -p "cat/best-version"
cat <<'END' > cat/best-version/best-version-0.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

pkg_setup() {
    if ! best_version cat/pretend-installed >/dev/null ; then
        die "failed cat/pretend-installed"
    fi

    BV1=$(best_version cat/pretend-installed )
    [[ "$BV1" == "cat/pretend-installed-1" ]] || die "BV1 is $BV1"

    if best_version cat/doesnotexist >/dev/null ; then
        die "not failed cat/doesnotexist"
    fi

    BV2=$(best_version cat/doesnotexist )
    [[ "$BV2" == "" ]] || die "BV2 is $BV2"

    if ! best_version virtual/virtual-pretend-installed >/dev/null ; then
        die "failed virtual/virtual-pretend-installed"
    fi

    BV3=$(best_version virtual/virtual-pretend-installed )
    [[ "$BV3" == "cat/pretend-installed-1" ]] || die "BV3 is $BV3"

    if best_version virtual/virtual-doesnotexist >/dev/null ; then
        die "not failed virtual/virtual-doesnotexist"
    fi

    BV2=$(best_version virtual/virtual-doesnotexist )
    [[ "$BV4" == "" ]] || die "BV4 is $BV4"
}
END
mkdir -p "cat/has-version"
cat <<'END' > cat/has-version/has-version-0.ebuild || exit 1
EAPI="${PV}"
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

pkg_setup() {
    if ! has_version cat/pretend-installed ; then
        die "failed cat/pretend-installed"
    fi

    if has_version cat/doesnotexist >/dev/null ; then
        die "not failed cat/doesnotexist"
    fi
}
END
mkdir -p "cat/match"
cat <<'END' > cat/match/match-0.ebuild || exit 1
EAPI="${PV}"
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
IUSE="spork"
LICENSE="GPL-2"
KEYWORDS="test"

pkg_setup() {
    if ! portageq match "${ROOT}" cat/pretend-installed >/dev/null ; then
        die "failed cat/pretend-installed"
    fi

    cat <<'DONE' > ${T}/expected
cat/pretend-installed-0
cat/pretend-installed-1
DONE
    portageq match "${ROOT}" cat/pretend-installed > ${T}/got
    cmp ${T}/expected ${T}/got || die "oops"

    if portageq match "${ROOT}" cat/doesnotexist >/dev/null ; then
        die "not failed cat/doesnotexist"
    fi

    BV2=$(portageq match "${ROOT}" cat/doesnotexist )
    [[ "$BV2" == "" ]] || die "BV2 is $BV2"
}
END
cd ..

mkdir -p repo14/{profiles/profile,metadata,eclass} || exit 1
cd repo14 || exit 1
echo "test-repo-14" >> profiles/repo_name || exit 1
cat <<END > profiles/profile/virtuals
virtual/virtual-pretend-installed cat/pretend-installed
virtual/virtual-doesnotexist cat/doesnotexist
END
echo "cat" >> metadata/categories.conf || exit 1
cat <<END > profiles/profile/make.defaults
CHOST="i286-badger-linux-gnu"
PALUDIS_COMMAND="/bin/false"
END
mkdir -p "packages/cat/in-ebuild-die"
cat <<END > packages/cat/in-ebuild-die/in-ebuild-die-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"

pkg_setup() {
    die "boom"
}
END
mkdir -p "packages/cat/in-subshell-die"
cat <<END > packages/cat/in-subshell-die/in-subshell-die-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS=""
LICENSE="GPL-2"
PLATFORMS="test"

pkg_setup() {
    ( hasq test \$PLATFORMS && die "boom" )
}
END
mkdir -p "packages/cat/success"
cat <<END > packages/cat/success/success-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORMS="test"

pkg_setup() {
    optionq spork && die "boom"
}
END
mkdir -p "packages/cat/unpack-die"
cat <<END > packages/cat/unpack-die/unpack-die-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORMS="test"

src_unpack() {
    echo "123" > f.bz2
    unpack ./f.bz2
}
END
mkdir -p "packages/cat/emake-fail"
cat <<END > packages/cat/emake-fail/emake-fail-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORMS="test"

src_compile() {
    emake monkey
}
END
mkdir -p "packages/cat/best-version"
cat <<'END' > packages/cat/best-version/best-version-0.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORMS="test"

pkg_setup() {
    if ! best_version cat/pretend-installed >/dev/null ; then
        die "failed cat/pretend-installed"
    fi

    BV1=$(best_version cat/pretend-installed )
    [[ "$BV1" == "cat/pretend-installed-1:0::installed" ]] || die "BV1 is $BV1"

    if best_version cat/doesnotexist >/dev/null ; then
        die "not failed cat/doesnotexist"
    fi

    BV2=$(best_version cat/doesnotexist )
    [[ "$BV2" == "" ]] || die "BV2 is $BV2"

    if ! best_version virtual/virtual-pretend-installed >/dev/null ; then
        die "failed virtual/virtual-pretend-installed"
    fi

    BV3=$(best_version virtual/virtual-pretend-installed )
    [[ "$BV3" == "virtual/virtual-pretend-installed-1::installed-virtuals (virtual for cat/pretend-installed-1:0::installed)" ]] \
        || die "BV3 is $BV3"

    if best_version virtual/virtual-doesnotexist >/dev/null ; then
        die "not failed virtual/virtual-doesnotexist"
    fi

    BV2=$(best_version virtual/virtual-doesnotexist )
    [[ "$BV4" == "" ]] || die "BV4 is $BV4"
}
END
mkdir -p "packages/cat/has-version"
cat <<'END' > packages/cat/has-version/has-version-0.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORMS="test"

pkg_setup() {
    if ! has_version cat/pretend-installed ; then
        die "failed cat/pretend-installed"
    fi

    if has_version cat/doesnotexist >/dev/null ; then
        die "not failed cat/doesnotexist"
    fi
}
END
mkdir -p "packages/cat/match"
cat <<'END' > packages/cat/match/match-0.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORM="test"

pkg_setup() {
    portageq match "${ROOT}" cat/foo | while read a ; do
        einfo moo
    done
}
END
mkdir -p "packages/cat/ever"
cat <<'END' > packages/cat/ever/ever-1.3.ebuild || exit 1
if ever at_least 2 ; then
    DESCRIPTION="Really Not The Description"
elif ever at_least 1.2.3 ; then
    DESCRIPTION="The Description"
else
    DESCRIPTION="Not The Description"
fi

HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORM="test"

pkg_setup() {
    ever at_least 1.2 || die "at_least 1.2"
    ever at_least 1.3 || die "at_least 1.3"
    ever at_least 1.4 && die "at_least 1.4"

    ever at_least 1.2 1.2 || die "at_least 1.2 1.2"
    ever at_least 1.3 1.2 && die "at_least 1.3 1.2"
    ever at_least 1.4 1.2 && die "at_least 1.4 1.2"
}
END
mkdir -p "packages/cat/econf-phase"
cat <<'END' > packages/cat/econf-phase/econf-phase-0.ebuild || exit 1
DESCRIPTION="The Description"

HOMEPAGE="http://example.com/"
SRC_URI=""
SLOT="0"
MYOPTIONS="spork"
LICENSE="GPL-2"
PLATFORM="test"

src_unpack() {
    mkdir ${S}
    echo "#!/bin/bash" > ${S}/configure
    chmod +x ${S}/configure
}

src_compile() {
    econf
}
END
cd ..

mkdir -p repo15/{eclass,distfiles,profiles/profile/subprofile} || exit 1
cd repo15 || exit 1
echo "test-repo-15" >> profiles/repo_name || exit 1
cat <<END >profiles/profiles.desc || exit 1
test profile stable
test profile/subprofile stable
END
cat <<END > profiles/profile/make.defaults || exit 1
ARCH=test
END
cat <<END > profiles/profile/virtuals || exit 1
virtual/one	cat-one/pkg-one
virtual/two	cat-two/pkg-two
END
cat <<END >profiles/profile/subprofile/parent || exit 1
..
END
cat <<END > profiles/profile/subprofile/virtuals || exit 1
virtual/one	cat-two/pkg-two
virtual/two	cat-one/pkg-one
virtual/three	cat-three/pkg-three
END
cd ..

mkdir -p repo16/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo16/category/package-{a,b,c} || exit 1
cd repo16 || exit 1
echo "test-repo-16" >> profiles/repo_name || exit 1
echo "category" >> profiles/categories || exit 1
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > category/package-a/package-a-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="foo"
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
cat <<END > category/package-b/package-b-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="bar"
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
cat <<END > category/package-c/package-c-1.ebuild || exit 1
DESCRIPTION="The Description"
HOMEPAGE="http://example.com/"
SRC_URI="foo bar"
SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="test"
DEPEND=""
END
echo "something" > distfiles/foo || exit 1
cat <<END > Manifest || exit 1
DIST bar 12 RMD160 90bd2a71cf9d8cf744b0afc0e9a00b999bb59f72 SHA1 f27a44461791182539e3d22516148b1e5289fdce SHA256 27cd06afc317a809116e7730736663b9f09dd863fcc37b69d32d4f5eb58708b2
DIST foo 10 RMD160 9e19cc1527a061585aa02dae8b7f4047dcd16275 SHA1 50a4e988380c09d290acdab4bd53d24ee7b497df SHA256 4bc453b53cb3d914b45f4b250294236adba2c0e09ff6f03793949e7e39fd4cc1
END
cp Manifest category/package-a/
cp Manifest category/package-b/
cp Manifest category/package-c/
rm Manifest
cd ..

mkdir -p repo17/{eclass,distfiles,profiles/profile} || exit 1
mkdir -p repo17/category/package || exit 1
cd repo17 || exit 1
echo "test-repo-17" >> profiles/repo_name || exit 1
echo "category" >> profiles/categories || exit 1
cat <<END > profiles/profile/make.defaults
ARCH=test
END
cat <<END > category/package/package-1.ebuild || exit 1
EAPI="exheres-0"
SLOT="0"
PLATFORMS="test"
DEPENDENCIES="cat/pkg1 build: cat/pkg2 build,run: cat/pkg3 suggested: cat/pkg4 post: cat/pkg5"
END
cd ..

cd ..

