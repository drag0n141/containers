ALTER SYSTEM SET shared_preload_libraries = "vchord.so"
ALTER SYSTEM SET search_path TO "$user", public, vectors