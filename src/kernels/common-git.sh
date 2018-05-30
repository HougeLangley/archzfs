# For build.sh
mode_name="common-git"
mode_desc="Select and use the packages that are common between all kernels (git version)"

# Version for GIT packages
pkgrel_git="1"
zfs_git_commit=""
spl_git_commit=""
zfs_git_url="https://github.com/zfsonlinux/zfs.git"
spl_git_url="https://github.com/zfsonlinux/spl.git"

header="\
# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
#"

update_common_git_pkgbuilds() {
    pkg_list=("zfs-utils-common-git")
    archzfs_package_group="archzfs-linux-git"
    zfs_pkgver="" # Set later by call to git_calc_pkgver
    zfs_pkgrel=${pkgrel_git}
    zfs_utils_conflicts="'zfs-utils-common' 'spl-utils-common-git'"
    zfs_utils_pkgname="zfs-utils-common-git"
    spl_utils_pkgbuild_path="packages/${kernel_name}/${spl_utils_pkgname}"
    zfs_utils_pkgbuild_path="packages/${kernel_name}/${zfs_utils_pkgname}"
    zfs_src_target="git+${zfs_git_url}"
    zfs_src_hash="SKIP"
    zfs_makedepends="\"git\""
    zfs_workdir="\${srcdir}/zfs"

    zfs_utils_replaces='replaces=("spl-utils-common-git")'

    if have_command "update"; then
        git_check_repo
        git_calc_pkgver
    fi
    zfs_src_target="git+${zfs_git_url}#commit=${latest_zfs_git_commit}"
}
