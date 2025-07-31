<?php

// ===================================================================
// File: app/Http/Middleware/TenantOnly.php
// ===================================================================

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TenantOnly
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next)
    {
        if (! Auth::check()) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthenticated',
            ], 401);
        }

        $user = Auth::user();

        if ($user->role !== 'tenant') {
            return response()->json([
                'success' => false,
                'message' => 'Tenant access required',
            ], 403);
        }

        if ($user->status !== 'active') {
            return response()->json([
                'success' => false,
                'message' => 'Account is inactive',
            ], 403);
        }

        return $next($request);
    }
}
