function healthRpc(ctx, logger, nk, payload) {
  return JSON.stringify({ status: 'ok', timestamp: new Date().toISOString() });
}

function InitModule(ctx, logger, nk, initializer) {
  logger.info('Nakama runtime initialized.');
  initializer.registerRpc('health', healthRpc);
}
