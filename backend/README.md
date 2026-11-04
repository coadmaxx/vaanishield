# backend/ — shared model-loading modules (not a standalone service)

This directory used to run its own FastAPI server with a heavier, GPU-oriented
detection pipeline (WavLM + ECAPA-TDNN) alongside `vaanishield-backend/`'s
lightweight numpy/scipy one. Running two live backends with two incompatible
WebSocket protocols was confusing and only one (`vaanishield-backend/`) was
ever wired to the dashboard — so the standalone server here has been retired.

What's left, and why it's still here:

- `app/models/ecapa_verifier.py`, `app/models/wavlm_detector.py` — the two
  genuinely working pieces of this backend: real pretrained-model loading
  (`speechbrain/spkrec-ecapa-voxceleb`, `microsoft/wavlm-base-plus`). Ported
  into `vaanishield-backend/vaanishield/detectors/{asv_ecapa,cm_wavlm}.py`
  as optional real-model backends behind the same `CMModel`/`ASVModel`
  interface the stub detectors use (`VG_ASV_BACKEND=ecapa`,
  `VG_CM_BACKEND=wavlm`). Kept here as the canonical source rather than
  duplicated, and imported by `vaanishield-backend` via a `sys.path` insert —
  the same pattern `vaanishield/semantic/signal.py` already uses for
  `services/asr/` below.
- `services/asr/` — the ASR + transliteration stack, already depended on by
  `vaanishield-backend/vaanishield/semantic/signal.py` for the live
  transcript/keyword signal. Unrelated to the model files above; kept for
  the same reason.

Everything else (`app/main.py`, `api/`, `engine/`, `core/`, `tests/`,
`Dockerfile`) was the standalone server and has been removed. The single
integrated backend is `vaanishield-backend/` — see its `README.md` and
`docs/PROTOCOL.md` for the actual, currently-running system.
