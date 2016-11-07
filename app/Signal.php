<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property string $created_at
 * @property string $updated_at
 * @property string $deleted_at
 * @property Lane[] $lanes
 */
class Signal extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'signal';

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * @var array
     */
    protected $fillable = ['created_at', 'updated_at', 'deleted_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function lanes()
    {
        return $this->hasMany('App\Lane');
    }
}
