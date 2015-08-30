// Created by Crowbar 0.29.0.0

$ModelName "player\elis\po\police.mdl"

$BodyGroup "elis"
{
	studio "police_reference.smd"
}


$SurfaceProp "flesh"

$Contents "solid"

$EyePosition 0 0 73

$MaxEyeDeflection 90

$CDMaterials "models\player\elis\po\"

$Attachment "forward" "ValveBiped.forward" 0 0 0 rotate 0 0 0
$Attachment "grenade0" "ValveBiped.Bip01_Spine" 4.08 3.9 8.66 rotate 82.85 25.2 20.51
$Attachment "grenade1" "ValveBiped.Bip01_Spine" 3.81 1.45 8.92 rotate 72.71 80.54 78.54
$Attachment "grenade2" "ValveBiped.Bip01_Spine" -2.13 4.42 -8.82 rotate -77.4 -55.53 -117.32
$Attachment "grenade3" "ValveBiped.Bip01_Spine" 3.84 6.03 8.24 rotate 62.51 -75.79 -79.34
$Attachment "pistol" "ValveBiped.Bip01_R_Thigh" 0.81 3.59 -6.3 rotate -1.52 -8.6 80.07
$Attachment "primary" "ValveBiped.Bip01_Spine2" 11.08 -4.21 -5.77 rotate -18.93 178.22 1.07
$Attachment "defusekit" "ValveBiped.Bip01_Pelvis" 2.21 -0.19 -5.09 rotate -70.24 138.62 133.79
$Attachment "eholster" "ValveBiped.Bip01_L_Thigh" 9.84 -6.01 1.49 rotate 84.37 -56.95 120.32
$Attachment "c4" "ValveBiped.Bip01_Spine2" 9.36 -8.28 -6.81 rotate -41.21 58.9 18.01
$Attachment "lfoot" "ValveBiped.Bip01_L_Foot" 0 5.2 0 rotate 0 0 0
$Attachment "rfoot" "ValveBiped.Bip01_R_Foot" 0 5.2 0 rotate 0 0 0
$Attachment "muzzle_flash" "ValveBiped.Bip01_L_Hand" 0 0 0 rotate 0 0 0

$CBox 0 0 0 0 0 0

$BBox -6.932 -29.275 -2.542 9.386 29.312 77.88

// $HBoxSet "cstrike"
// $HBox 3 "ValveBiped.Bip01_Pelvis" -8.299 -7.727 -5.429 8.299 2.007 6.583
// $HBox 6 "ValveBiped.Bip01_L_Thigh" 4.576 -5.377 -3.432 22.879999 3.775 4.576
// $HBox 6 "ValveBiped.Bip01_L_Calf" -0.291 -4.295 -3.432 20.882999 3.151 3.432
// $HBox 6 "ValveBiped.Bip01_L_Foot" -2.288 -1.144 -2.579 5.72 4.576 2.007
// $HBox 7 "ValveBiped.Bip01_R_Thigh" 4.576 -5.377 -3.432 22.879999 3.775 4.576
// $HBox 7 "ValveBiped.Bip01_R_Calf" -0.291 -4.295 -3.432 20.882999 3.151 3.432
// $HBox 7 "ValveBiped.Bip01_R_Foot" -2.288 -1.144 -2.007 5.72 4.576 2.579
// $HBox 3 "ValveBiped.Bip01_Spine1" -9.152 -1.258 -8.008 4.576 11.326 8.008
// $HBox 2 "ValveBiped.Bip01_Spine2" -3.068 -3.432 -9.693 13.572 10.317 9.693
// $HBox 1 "ValveBiped.Bip01_Neck1" -0.104 -4.576 -2.86 5.512 2.288 2.86
// $HBox 1 "ValveBiped.Bip01_Head1" -0.416 -6.24 -3.64 9.36 4.441 3.016
// $HBox 4 "ValveBiped.Bip01_L_UpperArm" -1.144 -2.579 -2.288 14.872 2.579 2.288
// $HBox 4 "ValveBiped.Bip01_L_Forearm" -1.716 -2.402 -2.402 13.156 2.402 2.402
// $HBox 4 "ValveBiped.Bip01_L_Hand" 0.291 -2.465 -1.716 6.583 1.55 2.86
// $HBox 5 "ValveBiped.Bip01_R_UpperArm" -1.144 -2.579 -2.288 14.872 2.579 2.288
// $HBox 5 "ValveBiped.Bip01_R_Forearm" -1.716 -2.402 -2.402 13.156 2.402 2.402
// $HBox 5 "ValveBiped.Bip01_R_Hand" 0.291 -2.465 -2.86 6.583 1.55 1.716
// $SkipBoneInBBox

$DefineBone "ValveBiped.Bip01_Pelvis" "" 0 -0.554942 40.109589 0 0 89.999983 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_Thigh" "ValveBiped.Bip01_Pelvis" 4.046065 0 0 2.970156 -89.701128 -89.978727 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_Calf" "ValveBiped.Bip01_L_Thigh" 18.562099 0 0 0 1.959516 0 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_Foot" "ValveBiped.Bip01_L_Calf" 17.186298 0 0 -2.355087 -61.399931 -1.37487 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_Toe0" "ValveBiped.Bip01_L_Foot" 7.154623 0 0.000001 -0.306705 -33.481246 -0.571755 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_Thigh" "ValveBiped.Bip01_Pelvis" -4.046065 0 0 2.97013 -90.298988 -90.012222 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_Calf" "ValveBiped.Bip01_R_Thigh" 18.562067 0 0 0 1.959516 0 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_Foot" "ValveBiped.Bip01_R_Calf" 17.186253 0 0 2.347294 -61.400164 2.425903 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_Toe0" "ValveBiped.Bip01_R_Foot" 7.154621 -0.000001 0 -0.283556 -33.481413 -4.833357 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_Spine" "ValveBiped.Bip01_Pelvis" 0 3.478936 -3.101174 4.766608 89.999983 89.999983 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_Spine1" "ValveBiped.Bip01_Spine" 4.155668 0 0 0 -1.651035 0 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_Spine2" "ValveBiped.Bip01_Spine1" 3.661116 0 0 0 5.57528 0 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_Spine4" "ValveBiped.Bip01_Spine2" 9.278336 0 0 0 10.680679 0 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_Neck1" "ValveBiped.Bip01_Spine4" 3.438607 0.000001 0 0 23.268329 179.999856 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_Head1" "ValveBiped.Bip01_Neck1" 3.746079 0.000001 0 -0.000057 23.206685 0 0 0 0 0 0 0
$DefineBone "ValveBiped.forward" "ValveBiped.Bip01_Head1" 2.000014 -3 0 0 -75.999987 -89.999983 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.14191 1.017046 2.015167 -73.711341 169.030955 91.085259 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.26927 -0.000001 0 2.941794 -33.277963 -82.343662 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 12.160256 0.000001 -0.000004 0.000001 -3.459061 0 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.940959 -0.000005 -0.000059 -2.21786 2.063908 89.856515 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.141912 1.017039 -2.015167 73.71186 169.030955 -95.200871 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.269258 0.000008 0 -0.682164 -33.427107 87.135647 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 12.16025 -0.000004 0.000006 0 -3.45906 0 0 0 0 0 0 0
$DefineBone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.940948 0 0.000005 2.217405 2.063909 -89.381017 0 0 0 0 0 0
$DefineBone "ValveBiped.weapon_bone" "ValveBiped.Bip01_Spine" -43.648457 -1.081625 0.00003 -89.999983 -85.23344 0 0 0 0 0 0 0
$DefineBone "ValveBiped.weapon_bone_RHand" "ValveBiped.weapon_bone" -2 3.999995 -2.354676 -27.01694 2.049639 -84.348391 0 0 0 0 0 0
$DefineBone "ValveBiped.weapon_bone_LHand" "ValveBiped.weapon_bone_RHand" 5.701226 0 0 52.017294 22.279078 90.808684 0 0 0 0 0 0
$DefineBone "ValveBiped.weapon_bone_Clip" "ValveBiped.weapon_bone_LHand" 0 0 0 0 -0.000001 0 0 0 0 0 0 0

$BoneMerge "ValveBiped.Bip01_Pelvis"
$BoneMerge "ValveBiped.Bip01_Spine"
$BoneMerge "ValveBiped.Bip01_Spine1"
$BoneMerge "ValveBiped.Bip01_Spine2"
$BoneMerge "ValveBiped.Bip01_Spine4"
$BoneMerge "ValveBiped.Bip01_L_Clavicle"
$BoneMerge "ValveBiped.Bip01_L_UpperArm"
$BoneMerge "ValveBiped.Bip01_L_Forearm"
$BoneMerge "ValveBiped.Bip01_L_Hand"
$BoneMerge "ValveBiped.Bip01_R_Clavicle"
$BoneMerge "ValveBiped.Bip01_R_UpperArm"
$BoneMerge "ValveBiped.Bip01_R_Forearm"
$BoneMerge "ValveBiped.Bip01_R_Hand"
$BoneMerge "ValveBiped.weapon_bone"
$BoneMerge "ValveBiped.weapon_bone_RHand"
$BoneMerge "ValveBiped.weapon_bone_LHand"
$BoneMerge "ValveBiped.weapon_bone_Clip"


$PoseParameter "move_yaw" -180 180 0
$PoseParameter "body_pitch" -90 90 0
$PoseParameter "body_yaw" -90 90 0

$Sequence "ragdoll" {
	"police_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$IncludeModel "player/cs_player_shared.mdl"
$IncludeModel "player/ak_anims_ct.mdl"

$IKChain "rhand" "ValveBiped.Bip01_R_Hand" knee 0.707 0.707 0
$IKChain "lhand" "ValveBiped.Bip01_L_Hand" knee 0.707 0.707 0
$IKChain "rfoot" "ValveBiped.Bip01_R_Foot" knee 0.707 -0.707 0
$IKChain "lfoot" "ValveBiped.Bip01_L_Foot" knee 0.707 -0.707 0
$IKChain "ikclip" "ValveBiped.weapon_bone_Clip" knee 0.707 -0.707 0

$CollisionJoints "police_physics.smd"
{
	$mass 100
	$inertia 10
	$damping 0.05
	$rotdamping 5
	$rootbone "valvebiped.bip01_pelvis"

	$jointrotdamping "ValveBiped.Bip01_Pelvis" 3

	$jointmassbias "ValveBiped.Bip01_Spine1" 8
	$jointconstrain "ValveBiped.Bip01_Spine1" x limit -10 10 0
	$jointconstrain "ValveBiped.Bip01_Spine1" y limit -16 16 0
	$jointconstrain "ValveBiped.Bip01_Spine1" z limit -20 30 0

	$jointmassbias "ValveBiped.Bip01_Spine2" 9
	$jointconstrain "ValveBiped.Bip01_Spine2" x limit -10 10 0
	$jointconstrain "ValveBiped.Bip01_Spine2" y limit -10 10 0
	$jointconstrain "ValveBiped.Bip01_Spine2" z limit -20 20 0

	$jointmassbias "ValveBiped.Bip01_R_Clavicle" 4
	$jointrotdamping "ValveBiped.Bip01_R_Clavicle" 6
	$jointconstrain "ValveBiped.Bip01_R_Clavicle" x limit -15 15 0
	$jointconstrain "ValveBiped.Bip01_R_Clavicle" y limit -10 10 0
	$jointconstrain "ValveBiped.Bip01_R_Clavicle" z limit 0 45 0

	$jointmassbias "ValveBiped.Bip01_L_Clavicle" 4
	$jointrotdamping "ValveBiped.Bip01_L_Clavicle" 6
	$jointconstrain "ValveBiped.Bip01_L_Clavicle" x limit -15 15 0
	$jointconstrain "ValveBiped.Bip01_L_Clavicle" y limit -10 10 0
	$jointconstrain "ValveBiped.Bip01_L_Clavicle" z limit 0 45 0

	$jointmassbias "ValveBiped.Bip01_L_UpperArm" 5
	$jointrotdamping "ValveBiped.Bip01_L_UpperArm" 2
	$jointconstrain "ValveBiped.Bip01_L_UpperArm" x limit -15 20 0
	$jointconstrain "ValveBiped.Bip01_L_UpperArm" y limit -40 32 0
	$jointconstrain "ValveBiped.Bip01_L_UpperArm" z limit -80 25 0

	$jointmassbias "ValveBiped.Bip01_L_Forearm" 4
	$jointrotdamping "ValveBiped.Bip01_L_Forearm" 4
	$jointconstrain "ValveBiped.Bip01_L_Forearm" x limit -40 15 0
	$jointconstrain "ValveBiped.Bip01_L_Forearm" y limit 0 0 0
	$jointconstrain "ValveBiped.Bip01_L_Forearm" z limit -120 10 0

	$jointrotdamping "ValveBiped.Bip01_L_Hand" 1
	$jointconstrain "ValveBiped.Bip01_L_Hand" x limit -25 25 0
	$jointconstrain "ValveBiped.Bip01_L_Hand" y limit -35 35 0
	$jointconstrain "ValveBiped.Bip01_L_Hand" z limit -50 50 0

	$jointmassbias "ValveBiped.Bip01_R_UpperArm" 5
	$jointrotdamping "ValveBiped.Bip01_R_UpperArm" 2
	$jointconstrain "ValveBiped.Bip01_R_UpperArm" x limit -15 20 0
	$jointconstrain "ValveBiped.Bip01_R_UpperArm" y limit -40 32 0
	$jointconstrain "ValveBiped.Bip01_R_UpperArm" z limit -80 25 0

	$jointmassbias "ValveBiped.Bip01_R_Forearm" 4
	$jointrotdamping "ValveBiped.Bip01_R_Forearm" 4
	$jointconstrain "ValveBiped.Bip01_R_Forearm" x limit -40 15 0
	$jointconstrain "ValveBiped.Bip01_R_Forearm" y limit 0 0 0
	$jointconstrain "ValveBiped.Bip01_R_Forearm" z limit -120 10 0

	$jointrotdamping "ValveBiped.Bip01_R_Hand" 1
	$jointconstrain "ValveBiped.Bip01_R_Hand" x limit -25 25 0
	$jointconstrain "ValveBiped.Bip01_R_Hand" y limit -35 35 0
	$jointconstrain "ValveBiped.Bip01_R_Hand" z limit -50 50 0

	$jointmassbias "ValveBiped.Bip01_R_Thigh" 7
	$jointrotdamping "ValveBiped.Bip01_R_Thigh" 7
	$jointconstrain "ValveBiped.Bip01_R_Thigh" x limit -25 25 0
	$jointconstrain "ValveBiped.Bip01_R_Thigh" y limit -10 15 0
	$jointconstrain "ValveBiped.Bip01_R_Thigh" z limit -55 25 0

	$jointmassbias "ValveBiped.Bip01_R_Calf" 4
	$jointconstrain "ValveBiped.Bip01_R_Calf" x limit -10 25 0
	$jointconstrain "ValveBiped.Bip01_R_Calf" y limit -5 5 0
	$jointconstrain "ValveBiped.Bip01_R_Calf" z limit -10 115 0

	$jointmassbias "ValveBiped.Bip01_L_Thigh" 7
	$jointrotdamping "ValveBiped.Bip01_L_Thigh" 7
	$jointconstrain "ValveBiped.Bip01_L_Thigh" x limit -25 25 0
	$jointconstrain "ValveBiped.Bip01_L_Thigh" y limit -10 15 0
	$jointconstrain "ValveBiped.Bip01_L_Thigh" z limit -55 25 0

	$jointmassbias "ValveBiped.Bip01_L_Calf" 4
	$jointconstrain "ValveBiped.Bip01_L_Calf" x limit -10 25 0
	$jointconstrain "ValveBiped.Bip01_L_Calf" y limit -5 5 0
	$jointconstrain "ValveBiped.Bip01_L_Calf" z limit -10 115 0

	$jointmassbias "ValveBiped.Bip01_Head1" 4
	$jointrotdamping "ValveBiped.Bip01_Head1" 3
	$jointconstrain "ValveBiped.Bip01_Head1" x limit -50 50 0
	$jointconstrain "ValveBiped.Bip01_Head1" y limit -20 20 0
	$jointconstrain "ValveBiped.Bip01_Head1" z limit -26 30 0
}
