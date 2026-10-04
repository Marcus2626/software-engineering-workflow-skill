# Focused Debugging / Red-Green Loop

Use this only when debugging behavior whose cause is not already established.

1. Reproduce the failure or identify direct evidence.
2. Trace the actual cause before patching symptoms.
3. Add a focused failing regression test when practical.
4. Make the smallest causal fix.
5. Re-run the focused check to establish Green.
6. Broaden validation only when coupling/risk justifies it.
7. Record only material discoveries/decisions in the ExecPlan.

Avoid broad speculative refactors, fallback paths, or large diagnostic transcripts.
Place large traces/logs in `.agent/artifacts/` or `.agent/scratch/`.
