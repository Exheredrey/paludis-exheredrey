# Exheredludis

Paludis is package manager compatible with ebuild syntax on portage or exherbo's exheres allowing system specific source compilation and binary export with options to configure the result by the end-user.

22122019 `exheres-0` (bash backend for downstream management) ignores shellcheck which is generally not a good idea for bash/shell syntax.

This is an ongoing effort to fix code quality of paludis's backend and
make it POSIX compatible assuming that it is expected to be used on
unix/windows kernel respecting GNU ethique to support everything.

### Development

Development is regulated by [CONTRIBUTING.md](CONTRIBUTING.md)

This repository respects GNU ethique to support everything so code is expected to be written assuming that other platforms are a concern assuming usage of fixme messages for features that are not yet supported with a message informing where is the unimplemented code and comment with any additional info that would help with the implementation

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/exheredludis/exheredludis)

### Copyright

Repository is released under the terms and conditions of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html) unless stated otherwise with additional note:

```
This note has been written at 22122019 (DDMMYYYY), paths (hyperlink/pathnames) might change over time.

Exherbo linux developers currently listed on https://exherbo.org/developers.html are not allowed to use `exheredrey-0` library without sufficient quality assurance to avoid shellcheck violations and insufficient documentation.

Author of this library (Jacob Hrbek <kreyren@rixotstudio.cz>) reserves the right to revoke the permission to use the mensioned code in this scenario.
```

### Documentation

Documentation is expected to be written in the code from which the summary is then made on https://exheredludis.github.io/exheredludis/

Any relevant information is welcommed and endorsed

### Support

We are all idiots, ask any relevant question and you will get an answer where you are expected to verify provided info and confront the author if wrong or inaccurate info was provided to reduce false info which is counter-productive
