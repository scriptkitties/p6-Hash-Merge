# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic
Versioning](http://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2020-11-15

### Added

- A `gitlab-ci.yaml` has been added to ensure tests for this module are being
  ran when pushed to the GitLab mirror. It runs `prove6`, as well as queueing a
  build on rakudist.raku.org.

### Changed

- `Hash::Merge` has been rewritten to accomodate my current knowledge on the
  Raku programming language. This additionaly brings in a small change in the
  merging functionality, making it so the first argument passed to `merge-hash`
  is no longer modified itself, which could cause some awkward bugs in other
  programs.

- The README has been rewritten in Pod6.

- Perl 6 references have been updated to Raku.

- The main repository for this module has been moved from
  [GitHub](https://github.com/scriptkitties/p6-Hash-Merge.git) to
  [Sourcehut](https://git.sr.ht/~tyil/raku-hash-merge).

## [1.0.0] - 2018-03-28

### Added

- `:api` key in `META6.json`

- New `Hash::Merge` that exposes subs instead of augmenting `Hash`

### Changed

- Old `Hash::Merge` functionality moved to `Hash::Merge::Augment`

## [0.2.0] - 2018-03-14

### Added

- `LICENSE` file for Artistic License 2.0 ([GitHub#2](https://github.com/scriptkitties/p6-Hash-Merge/issues/2))

- `no precompilation` pragma ([GitHub#1](https://github.com/scriptkitties/p6-Hash-Merge/issues/1))
