<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $vehicle_type_id
 * @property string $reg_no
 * @property string $created_at
 * @property string $updated_at
 * @property string $deleted_at
 * @property VehicleType $vehicleType
 * @property Switch[] $switches
 */
class Vehicle extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'vehicle';

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * @var array
     */
    protected $fillable = ['vehicle_type_id', 'reg_no', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function vehicleType()
    {
        return $this->belongsTo('App\VehicleType');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function switches()
    {
        return $this->hasMany('App\Switch');
    }
}
