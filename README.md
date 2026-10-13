
(TODO)Expain perspective projection
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Demo http://r.tiye.me/Quatrefoil-GL/explain-perspective-projection/

### Migration candidate

The local migration candidate pins Calcit/procs 0.29.3 and formal module versions.
The released graph now uses Markdown 0.4.52, UI 0.7.37 and Respo 0.16.118.
Strict Caps installation accepts all nine formal modules without a
version-conflict override. All 367 definitions pass type checking, and the
complete strict workflow reports zero suggestions and diagnostics. The earlier
Markdown dependency boundary is repaired in its published release.
Unused direct alerts/memof/lilac/pointed-prompt dependencies and entry modules are
removed; Quatrefoil still provides its required Pointed Prompt transitive dependency.
The npm graph now uses stable meshline and hsluv packages instead of the unused
legacy alpha meshline package. Touch styles come from the installed formal module.
Calcit/procs pairing, immutable Yarn install and production/CDN-path builds pass;
the existing large 3D bundle warning is not suppressed or given a larger budget.
The generated JS math functions pass a local check of unit/perpendicular
projection axes and origin projection; this does not prove native or complete
scene behavior. The original scene, frontend entry and server destination are
retained. Current-graph JavaScript and CDN builds pass; browser menu, explanation,
keyboard camera movement and reload work without errors. The original 0.01 scene
scale and camera position remain unchanged; VR is unavailable in this browser and
is not claimed as tested. Remote CI/COS acceptance is still pending.
The retired compact.cirru is removed after local canonical-source checks; Git
history retains it for recovery. Use only calcit.cirru and deps.cirru.
A version declaration alone is not migration proof.

### Frontend deployment

CI uses Calcit 0.29.3 and Node 24 with strict Caps, immutable Yarn, full-definition
checks and the read-only strict workflow gate. Frontend dist assets use COS Action
v1.2.0 builtin public checksum verification, with no separate verification script.
PR CDN paths include PR/run/attempt; production uses the original repository
prefix. Fork PRs build without deployment secrets. The original main rsync
destination remains unchanged; no backend deployment is migrated.

### Workflow

https://github.com/Quamolit/quatrefoil-workflow

### License

MIT
