from django.http import JsonResponse


class AllAllowedHostsHealthCheckerMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.path == '/health' and request.method == 'GET':
            return JsonResponse(dict(health='OK'))
        return self.get_response(request)
