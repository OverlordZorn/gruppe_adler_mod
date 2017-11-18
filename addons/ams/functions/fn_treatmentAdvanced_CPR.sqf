/*
 * Author: Glowbal / edit by Willard
 * Callback for the CPR treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (alive _target && {(_target getVariable ["ace_medical_inCardiacArrest", false] || _target getVariable ["ace_medical_inReviveState", false])}) then {
    if (local _target) then {
        ["wil_ace_cpr_fnc_treatmentAdvanced_CPRLocal", [_caller, _target]] call CBA_fnc_localEvent;
    } else {
        ["wil_ace_cpr_fnc_treatmentAdvanced_CPRLocal", [_caller, _target], _target] call CBA_fnc_targetEvent;
    };
};

true;
