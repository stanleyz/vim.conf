// This needs to be added to QMK included code to add the required keys.
const key_override_t alt_h_left = ko_make_basic(MOD_MASK_ALT, KC_H, KC_LEFT);
const key_override_t alt_l_right = ko_make_basic(MOD_MASK_ALT, KC_L, KC_RIGHT);
const key_override_t alt_j_down = ko_make_basic(MOD_MASK_ALT, KC_J, KC_DOWN);
const key_override_t alt_k_up = ko_make_basic(MOD_MASK_ALT, KC_K, KC_UP);
const key_override_t alt_i_pageup = ko_make_basic(MOD_MASK_ALT, KC_I, KC_PAGE_UP);
const key_override_t alt_o_pagedown = ko_make_basic(MOD_MASK_ALT, KC_O, KC_PAGE_DOWN);
const key_override_t alt_u_home = ko_make_basic(MOD_MASK_ALT, KC_U, KC_HOME);
const key_override_t alt_p_end = ko_make_basic(MOD_MASK_ALT, KC_P, KC_END);
const key_override_t lctrl_a_home = ko_make_basic(MOD_BIT(KC_LCTL), KC_A, KC_HOME);
const key_override_t lctrl_e_end = ko_make_basic(MOD_BIT(KC_LCTL), KC_E, KC_END);
const key_override_t lctrl_f_right = ko_make_basic(MOD_BIT(KC_LCTL), KC_F, KC_RIGHT);
const key_override_t lctrl_b_left = ko_make_basic(MOD_BIT(KC_LCTL), KC_B, KC_LEFT);
const key_override_t lctrl_n_next = ko_make_basic(MOD_BIT(KC_LCTL), KC_N, KC_DOWN);
const key_override_t lctrl_p_previous = ko_make_basic(MOD_BIT(KC_LCTL), KC_P, KC_UP);
//upon testing, 4 is the Windows layer, 2 is the MAC.
//I don't see how to switch the other layer for each OS although following the doc.
const key_override_t rctrl_f4_alt_f4 = ko_make_with_layers(MOD_BIT(KC_RCTL), KC_F4, LALT(KC_F4), 4);

const key_override_t **key_overrides = (const key_override_t *[]) {
    &alt_h_left,
    &alt_l_right,
    &alt_j_down,
    &alt_k_up,
    &alt_i_pageup,
    &alt_o_pagedown,
    &alt_u_home,
    &alt_p_end,
    &lctrl_a_home,
    &lctrl_e_end,
    &lctrl_f_right,
    &lctrl_b_left,
    &lctrl_n_next,
    &lctrl_p_previous,
    &rctrl_f4_alt_f4,
    NULL
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    // bool to track whether alt tab registered
    static bool alttab_registered;
    switch (keycode) {

    case KC_TAB:
        // Detect the activation of only right Ctrl
        if (get_mods() == MOD_BIT(KC_RCTL)) {
            if (record->event.pressed) { // if TAB is pressed
                // Press down left alt
                add_mods(MOD_BIT(KC_LALT));
                // temporary release right ctrl
                del_mods(MOD_BIT(KC_RCTL));
                // trigger TAB
                register_code(KC_TAB);
                alttab_registered = true;
                // Add right ctrl back to trigger futher TAB swtich
                add_mods(MOD_BIT(KC_RCTL));
            } else { // if TAB is releajsed
                unregister_code(KC_TAB);
            }
            // Do not let QMK process the keycode further
            return false;
        }
        // Else, let QMK process the KC_ESC keycode as usual
        return true;

    case KC_RCTL:
        if (alttab_registered) {
            if (! record->event.pressed) { // Let QMK process the event
                del_mods(MOD_BIT(KC_LALT));
                alttab_registered = false;
            }
        }
        return true;
    }

    return true;
};
