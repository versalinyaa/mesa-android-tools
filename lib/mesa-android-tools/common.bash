mdroid_prog_name=$(basename "$0")

function mdroid_error() {
    echo "error: $@"
}

function mdroid_assert_has_lunch_var() {
    local var_name=$1

    if [[ -z "${!var_name}" ]]; then
        mdroid_error "environment variable $var_name is not defined"
        mdroid_error "have you run 'lunch'?"
        exit 1
    fi
}

function mdroid_assert_has_lunch() {
    mdroid_assert_has_lunch_var "ANDROID_BUILD_TOP"
    mdroid_assert_has_lunch_var "ANDROID_HOST_OUT"
    mdroid_assert_has_lunch_var "ANDROID_PRODUCT_OUT"
}

function mdroid_set_dirs() {
    mdroid_assert_has_lunch

    mdroid_mesa_srcdir="$ANDROID_BUILD_TOP/external/mesa"

    if ! [[ -d $mdroid_mesa_srcdir ]]; then
        mdroid_error "directory not found: $mdroid_mesa_srcdir"
        exit 1
    fi
}
