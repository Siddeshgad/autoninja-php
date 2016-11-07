<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $signal_id
 * @property string $created_at
 * @property string $updated_at
 * @property string $deleted_at
 * @property Signal $signal
 * @property Switch[] $switches
 * @property Switch[] $switches
 */
class Lane extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'lane';

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * @var array
     */
    protected $fillable = ['signal_id', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function signal()
    {
        return $this->belongsTo('App\Signal');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function toSwitches()
    {
        return $this->hasMany('App\Switch', 'to_lane_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function fromSwitches()
    {
        return $this->hasMany('App\Switch', 'from_lane_id');
    }
}
