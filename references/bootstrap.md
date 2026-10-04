# Repository Bootstrap Procedure

Use this only when a repository does not already have an adequate planning
workflow. Be conservative: do not overwrite mature project conventions.

## 1. Inspect before creating files

Discover:

- repository layout;
- language/framework/package manager;
- build command;
- test command(s);
- lint/format/typecheck commands;
- dev/start command;
- CI configuration;
- architecture/product/API docs;
- screenshot/E2E tooling;
- existing `AGENTS.md` files.

## 2. Create planning directories

Create when absent:

```text
.agent/
├── PLANS.md
├── exec-plans/
│   ├── active/
│   └── completed/
├── research/
├── scratch/
├── artifacts/
└── screenshots/
```

Copy/adapt `references/PLANS.base.md` to `.agent/PLANS.md`.

## 3. AGENTS.md

If no root `AGENTS.md` exists, create one. Keep it short and repository-specific.

It should normally include:

- concise repo map;
- canonical commands;
- architectural boundaries;
- reference to `.agent/PLANS.md`;
- rule for complex tasks to use an ExecPlan;
- visual-validation rule if applicable;
- durable safety constraints.

Use `assets/AGENTS.fragment.md` as a starting fragment, not as a blind overwrite.

If `AGENTS.md` already exists, append only missing planning guidance.

## 4. Gitignore

Normally ignore:

```gitignore
.agent/scratch/
.agent/screenshots/
```

Optionally ignore `.agent/artifacts/` if artifacts are purely local.

Do not automatically ignore `.agent/research/`, `.agent/PLANS.md`, or
`.agent/exec-plans/`; these are often useful durable project state.

Respect existing repository policy.

## 5. Verify

After bootstrap:

- confirm paths exist;
- confirm `AGENTS.md` references `.agent/PLANS.md`;
- confirm repository commands are accurate;
- do not claim commands were validated unless they were actually run.

## 6. Do not over-bootstrap

Do not create architecture/product docs merely to satisfy a template.

Create only what the current repository and task need.
