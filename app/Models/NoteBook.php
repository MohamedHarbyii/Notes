<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NoteBook extends Model
{
    use HasFactory;
    protected $fillable=["user_id","title"];
    public $table="notebooks";
}
